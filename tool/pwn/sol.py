from pwn import *
import random
import hashlib

r=remote('edu-ctf.csie.org', 54322)

tbl=dict()

def pre():
    for i in range(0,2**24):
        cur = hashlib.md5(str(i).encode()).hexdigest()[0:8]
        tbl[cur]=i

def sol():
    print(r.readuntil(b'such that md5(i)[0:8] == "'))
    h=r.readuntil(b'"')[:-1]
    mac=h.decode()
    print(h)
    if mac in tbl:
        r.sendline(f'{tbl[mac]}'.encode())
        r.recvuntil(b': ')
        return
    print('404')
    for i in range(0,2**24):
        cur = hashlib.md5(str(i).encode()).hexdigest()[0:8]
        if cur == mac:
            print(i,cur,mac)
            r.sendline(str(i).encode())
            r.recvuntil(b': ')
            break;
pre()
print('done')

sol()
for i in range(12):
    print(r.readline())
print(r.recvuntil(b'choice: '))
r.sendline(b'3')
for i in range(10):
    sol()
r.interactive()

r.interactive()
