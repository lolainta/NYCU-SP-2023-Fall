from pwn import *
import sys


def upload(fn):
    r.recvuntil(b"Give me your share object:\n")
    with open(fn, "rb") as f:
        z = f.read()
    z = base64.b64encode(z)
    r.sendline(z)


if len(sys.argv) < 2:
    sys.exit(-1)

r = remote("edu-ctf.zoolab.org", 10002)
upload(sys.argv[1])
r.interactive()
r.close()
