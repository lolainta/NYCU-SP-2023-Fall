from pwn import *

r = process("./baby-crackme")
print(r.recvuntil(b"\n"))
msg = b""
for i in range(0, 0x25, 4):
    # print(i,i+1,i+2,i+3)
    # print(p8(i),p8(i+1),p8(i+2),p8(i+3))
    msg += p8(i) + p8(i + 1) + p8(i + 2) + p8(i + 3)
print(msg)
r.sendline(msg)
r.interactive()
