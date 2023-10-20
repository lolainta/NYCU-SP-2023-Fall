#!/usr/bin/python
from module.checker import *
from module.math import *
from sys import argv
from os import system, popen
from string import ascii_uppercase

charset = ascii_uppercase

challenge_info = f"""
1. Read the first 8 bytes from '/tmp/lab_chal'
2. Write the data to STDOUT (fd = 1)

let a = open('/tmp/lab_chal', 'r')
print(a.read(8))
"""

data = "".join(
    [charset[i % len(charset)] for i in open("/dev/urandom", "rb").read(0x20)]
).encode()
open("/tmp/lab_chal", "wb").write(data)


init_list = []

ans = int.from_bytes(data[:8], "little")
ans_list = [
    (RSP_DEFAULT, ans),
]

if __name__ == "__main__":
    if len(argv) < 2:
        print(f"{C.BLUE}[+]{C.NC} Usage: python3 {__file__} <path_to_asm_file>")
        print(challenge_info)
        exit(0)

    system("make")
    out = popen(f"./build/{argv[1][:-4]}").read()
    if out.encode() == data[:8]:
        print(f"{C.GREEN}[+] CORRECT :){C.NC}")
    else:
        print(f"{C.RED}[+] WRONG :({C.NC}")
    print()
