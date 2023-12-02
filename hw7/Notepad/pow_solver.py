#!/usr/bin/env python3
import hashlib
import sys
from pwn import *


def is_valid(digest, difficulty):
    zeros = "0" * difficulty
    if sys.version_info.major == 2:
        digest = [ord(i) for i in digest]
    bits = "".join(bin(i)[2:].zfill(8) for i in digest)
    return bits[:difficulty] == zeros


def solve(prefix, difficulty):
    i = 0
    while True:
        i += 1
        s = prefix + str(i)
        if is_valid(hashlib.sha256(s.encode()).digest(), difficulty):
            return i


if __name__ == "__main__":
    r = remote("10.113.184.121", 10044)
    r.readline()
    r.readuntil(b"sha256(")
    prefix = r.readuntil(b" + ???) == ").decode()[:-11]
    r.readuntil(b"Answer: ")
    print(f"Solving for {prefix} difficulty 22...")
    ans = solve(prefix, 22)
    print(f"Sending {ans}")
    r.sendline(str(ans).encode())
    r.readline()
    r.readline()
    res = r.readline().decode().strip()
    print(res)
    port = int(res.split(" ")[-1][:-1])
    print(f"Port: {port}")
    with open("port", "w") as f:
        f.write(str(port))
    r.readline()
