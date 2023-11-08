from pwn import *

context.terminal = ["tmux", "splitw", "-h"]

p = process("./simple-crackme")

attach(p.pid)

arr = [
    101,
    102,
    111,
    53,
    69,
    99,
    71,
    88,
    47,
    55,
    121,
    49,
    69,
    49,
    66,
    67,
    74,
    119,
    118,
    80,
    68,
    53,
    99,
    114,
    101,
    84,
    111,
    56,
    98,
    120,
    77,
    80,
    72,
    68,
    48,
    98,
    85,
    104,
    80,
    111,
    70,
    74,
    110,
    51,
    79,
    78,
    72,
    60,
    0,
]

p.sendline(str(len(arr)).encode())

for i in range(len(arr)):
    p.sendline(str(arr[i]).encode())
p.interactive()
