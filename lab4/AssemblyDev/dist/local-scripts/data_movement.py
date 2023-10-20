#!/usr/bin/python
from module.checker import *
from module.math import *
from sys import argv

challenge_info = f'''
{C.BLUE}# Modify register value{C.NC}
RAX += 0x87
RBX -= 0x63
RCX, RDX = RDX, RCX

{C.BLUE}# Modify memory value{C.NC}
MEM[RSP+0x0:RSP+0x4] += 0xdeadbeef
MEM[RSP+0x4:RSP+0x8] -= 0xfaceb00c
MEM[RSP+0x8:RSP+0xc], MEM[RSP+0xc:RSP+0x10] = MEM[RSP+0xc:RSP+0x10], MEM[RSP+0x8:RSP+0xc]
'''

_rax = get_rand()
_rbx = get_rand()
_rcx = get_rand()
_rdx = get_rand()
mem = list()
for i in range(4):
    mem.append(get_rand(4))

init_list = [
    ("rax", _rax),
    ("rbx", _rbx),
    ("rcx", _rcx),
    ("rdx", _rdx),
    (RSP_DEFAULT + 0x0, mem[0], 4),
    (RSP_DEFAULT + 0x4, mem[1], 4),
    (RSP_DEFAULT + 0x8, mem[2], 4),
    (RSP_DEFAULT + 0xc, mem[3], 4),
]
ans_list = [
    ("rax", add(_rax, 0x87)),
    ("rbx", sub(_rbx, 0x63)),
    ("rcx", _rdx),
    ("rdx", _rcx),
    (RSP_DEFAULT + 0x0, add(mem[0], 0xdeadbeef, 4), 4),
    (RSP_DEFAULT + 0x4, sub(mem[1], 0xfaceb00c, 4), 4),
    (RSP_DEFAULT + 0x8, mem[3], 4),
    (RSP_DEFAULT + 0xc, mem[2], 4),
]

if __name__ == "__main__":
    if len(argv) < 2:
        print(f"{C.BLUE}[+]{C.NC} Usage: python3 {__file__} <path_to_asm_file>")
        print(challenge_info)
        exit(0)

    code = open(argv[1], 'r').read()
    Checker(init_list, ans_list, code)
