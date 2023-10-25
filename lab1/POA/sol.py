from pwn import *
from copy import deepcopy


def padding_oracle_attack(r, ct, iv):
    block_len = 16
    pt = b""
    # for i in range(block_len - 1, -1, -1):
    #     for c in range(256):
    #         cur = deepcopy(iv)
    #         if c == iv[i] and i != 11:
    #             continue
    #         # print(cur, iv)
    #         cur[i] = c
    #         # print(cur,iv)
    #         r.sendline((cur + ct).hex().encode())
    #         ret = r.recvline()
    #         if ret == b"Well received :)\n" :
    #             pt = bytes([0x80 ^ c ^ iv[i]]) + pt
    #             # print(pt)
    #             iv[i] = c ^ 0x80 ^ 0x00
    #             break
    # return pt
    for i in range(block_len - 1, -1, -1):
        for c in range(128, 256):
            iv[i] ^= c
            r.sendline((iv + ct).hex().encode())
            ret = r.recvline()
            if ret == b"Well received :)\n":
                pt = bytes([c ^ 0x80]) + pt
                iv[i] ^= 0x80
                break
            else:
                iv[i] ^= c
        else:
            pt = bytes([0x80]) + pt
            iv[i] ^= 0x80
    return pt


r = remote("edu-ctf.zoolab.org", 10004)
output = bytes.fromhex(r.recvline(keepends=False).decode())
N = 2
pt = b"".join(
    [
        padding_oracle_attack(
            r,
            bytearray(output[(i + 1) * 16 : (i + 2) * 16]),
            bytearray(output[i * 16 : (i + 1) * 16]),
        )
        for i in range(N)
    ]
)
print(pt[: pt.index(b"}") + 1].decode())
