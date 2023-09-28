from pwn import *
from Crypto.Util.number import long_to_bytes

r = remote("edu-ctf.zoolab.org", 10005)

n = int(r.recvline().decode())
e = int(r.recvline().decode())
enc = int(r.recvline().decode())

mod_inv = pow(3, -1, n)
mod_inv_enc = pow(mod_inv, e, n)

drift = 0
cur = enc
stage = 1
pt = []
ans = 0


while stage < n:
    r.sendline(str(cur).encode())
    ret = int(r.recvline().decode())
    lsb = (ret - drift) % 3
    ans += lsb * stage
    stage *= 3
    print(ans)
    drift = (drift + lsb) * mod_inv % n
    cur = (cur * mod_inv_enc) % n
    print(stage)

print(ans)
print(long_to_bytes(ans))
