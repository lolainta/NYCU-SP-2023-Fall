from pwn import *
from Crypto.Util.number import long_to_bytes

r = remote("edu-ctf.zoolab.org", 10005)
n = int(r.recvline().decode())
e = int(r.recvline().decode())
enc = int(r.recvline().decode())

mod = 3
mod_inv = pow(mod, -1, n)
mod_inv_e = pow(mod, -e, n)
ans = 0
cnt = 1
rem = 0

while cnt <= n:
    r.sendline(str(enc).encode())
    ret = int(r.recvline().decode())
    x = (ret - rem) % mod
    ans += x * cnt

    enc = (enc * mod_inv_e) % n
    rem = (rem + x) * mod_inv % n
    cnt *= mod
    print(cnt)

print(ans)
print(long_to_bytes(ans))
