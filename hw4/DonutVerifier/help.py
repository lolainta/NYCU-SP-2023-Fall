from pwn import *

context.terminal = ["tmux", "splitw", "-h"]

p = process("./quick-verifier")

attach(p.pid)
