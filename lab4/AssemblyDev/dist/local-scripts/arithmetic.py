#!/usr/bin/python
from module.checker import *
from module.math import *
from sys import argv

challenge_info = f'''
let a = MEM[RSP+0x0:RSP+0x4]
let b = MEM[RSP+0x4:RSP+0x8]
let c = MEM[RSP+0x8:RSP+0xc]

EAX = a + b
EBX = a - b
ECX = -c
EDX = 9*a + 7
'''

a = get_rand(4)
b = get_rand(4)
c = get_rand(4)

init_list = [
    (RSP_DEFAULT + 0x0, a, 4),
    (RSP_DEFAULT + 0x4, b, 4),
    (RSP_DEFAULT + 0x8, c, 4),
]
ans_list = [
    ("eax", add(a, b, 4)),
    ("ebx", sub(a, b, 4)),
    ("ecx", neg(c, 4)),
    ("edx", add(mul(a, 9, 4), 7, 4)),
]

if __name__ == "__main__":
    if len(argv) < 2:
        print(f"{C.BLUE}[+]{C.NC} Usage: python3 {__file__} <path_to_asm_file>")
        print(challenge_info)
        exit(0)

    code = open(argv[1], 'r').read()
    Checker(init_list, ans_list, code)
