#!/usr/bin/python
from module.checker import *
from module.math import *
from sys import argv

challenge_info = f'''
let a = MEM[RSP+0x0:RSP+0x4]
let b = MEM[RSP+0x4:RSP+0x8]
let c = MEM[RSP+0x8:RSP+0xc]
let d = MEM[RSP+0xc:RSP+0x10]

{C.BLUE}# a, b -> signed 4 btyes integer{C.NC}
if a >= b:
    EAX = a
else:
    EAX = b

{C.BLUE}# c, d -> unsigned 4 btyes integer{C.NC}
if c < d:
    EBX = c
else:
    EBX = d

if c is an odd number:
    ECX = c // 8
else:
    ECX = c * 4
'''

a = get_rand(4)
b = get_rand(4)
c = get_rand(4)
d = get_rand(4)


init_list = [
    (RSP_DEFAULT + 0x0, a, 4),
    (RSP_DEFAULT + 0x4, b, 4),
    (RSP_DEFAULT + 0x8, c, 4),
    (RSP_DEFAULT + 0xc, d, 4),
]

a = u2signed(a, 4)
b = u2signed(b, 4)
_eax = (a if a >= b else b) & mask(4)
_ebx = (c if c < d else d) & mask(4)
_ecx = div(c, 8, 4) if is_odd(c) else mul(c, 4, 4)

ans_list = [
    ("eax", _eax),
    ("ebx", _ebx),
    ("ecx", _ecx),
]

if __name__ == "__main__":
    if len(argv) < 2:
        print(f"{C.BLUE}[+]{C.NC} Usage: python3 {__file__} <path_to_asm_file>")
        print(challenge_info)
        exit(0)

    code = open(argv[1], 'r').read()
    Checker(init_list, ans_list, code)

