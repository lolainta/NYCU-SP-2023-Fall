from data import encrypted_iv, encrypted_key, N, e
from Crypto.Util.number import long_to_bytes, bytes_to_long
from random import randbytes
from pwn import remote, process
from copy import deepcopy
from Crypto.Cipher import AES


def pad(m):
    length = 16 - len(m) % 16
    return m + chr(length).encode() * length


def unpad(c):
    length = c[-1]
    for char in c[-length:]:
        if char != length:
            raise ValueError
    return c[:-length]


def asymmetric_encryption(message, N, e):
    # encrypt message with RSA
    # message must be 16 bytes
    # padding 100 bytes random value
    padded_message = b"\xff" * 16 + message
    print(f"{padded_message = }")
    return pow(bytes_to_long(padded_message), e, N)


def symmetric_encryption(message, key, iv):
    # ecrypt message with AES + CBC Mode
    # message can be arbitrary length
    cipher = AES.new(
        key,
        AES.MODE_CBC,
        iv=iv,
    )
    ct = cipher.encrypt(pad(message))
    iv = cipher.iv
    return iv, ct


def valid(r, key, iv, ct):
    r.recvuntil(b"Give me the encrypted key: ")
    r.sendline(str(key).encode())
    r.recvuntil(b"Give me the encrypted iv: ")
    r.sendline(str(iv).encode())
    r.recvuntil(b"Give me the ciphertext: ")
    r.sendline(ct.hex().encode())
    # print(r.recvline().decode())
    # aes_key = r.recvline().decode().strip()
    # iv = r.recvline().decode().strip()

    # print(f"{aes_key = }")
    # print(f"{iv = }")
    ret = r.recvline().decode()
    if ret == "OK! Got it.\n":
        return True
    elif ret == "I do not understand.\n":
        return False
    else:
        print(key, iv, ct)
        assert False, ret


def test():
    from secret import p, q

    r = remote("10.113.184.121", "10031")
    ct = open("encrypted_flag_d6fbfd5306695c4a.not_png", "rb").read()

    d = pow(e, -1, (p - 1) * (q - 1))
    print(d)
    print(e)
    exit()
    tmp = 10
    assert pow(tmp, e, N) == pow(pow(tmp, d, N), e, N)
    print(hex(encrypted_iv))
    print(hex(encrypted_key))
    print(hex(N))
    print(hex(e))
    print(valid(r, encrypted_key, encrypted_iv, ct))


def test3():
    # r = process("./Alice_bd234b54edc91a4d.py")
    key = b"\xff" * 16
    print(f"{key = }, {bytes_to_long(key) = }")
    assert len(key) == 16
    pt = b"flag{This is a fake flag.}"
    # pt = long_to_bytes(1, blocksize=16)

    iv, ct = symmetric_encryption(pt, key)
    print(f"{iv = }", f"{ct = }")
    ekey = asymmetric_encryption(key, N, e)
    eiv = asymmetric_encryption(iv, N, e)
    print(f"{ekey = }")
    print(f"{eiv = }")

    r = remote("10.113.184.121", "10031")
    print(valid(r, ekey, eiv, ct))
    print(
        valid(
            r,
            encrypted_key,
            encrypted_iv,
            open("encrypted_flag.not_png", "rb").read(),
        )
    )


def dfs_key(r, len, key):
    print(f'{"    "*len}{len = }, {key = }')
    if len == 16:
        return
    key = bytearray(b"\x00" + deepcopy(key)[:-1])
    # print("    " * len, 68, sflag)
    skey = encrypted_key * pow(256 ** (15 - len), e, N) % N
    # skey = encrypted_key * pow(2, 8 * e * 11, N) % N
    for i in range(32, 127):
        key[0] = i
        # print(f"{'    '*len}{i = }, {key = }")
        iv, ct = symmetric_encryption(b"Hello, world!", key, b"a" * 16)
        iv_enc = pow(bytes_to_long(iv), e, N)
        if valid(r, skey, iv_enc, ct):
            print(f"{'    '*len}{len = }, {key = }, {i = }")
            dfs_key(r, len + 1, key)
        break
    print(f"{'    '*len}fail {len = }")


def daes(pt: bytearray) -> tuple[int, int, bytes]:
    assert len(pt) == 16
    assert isinstance(pt, bytearray)
    key = bytearray(b"a" * 16)
    iv = long_to_bytes(0, 16)
    cipher = AES.new(key, AES.MODE_CBC, iv)
    ct = cipher.encrypt(pt)
    key_enc = pow(bytes_to_long(key), e, N)
    iv_enc = pow(bytes_to_long(b"a" + iv), e, N)
    return key_enc, iv_enc, ct


def dfs_iv(r, enc_flag, len, iv):
    # print(f"{'    '*(len)}{len = }, {iv = }")
    if len == 17:
        return iv
    civ = deepcopy(iv)
    for i in range(len - 1):
        civ[-i - 1] ^= len
    for i in range(256):
        civ[-len] = i
        ekey, eiv, ct = daes(civ)
        # print(civ)
        if valid(r, ekey, enc_flag, ct):
            # print(f"{'    '*(len)}{i = }, {civ = }")
            for j in range(len):
                civ[-j - 1] ^= len
            ret = dfs_iv(r, enc_flag, len + 1, civ)
            if ret:
                return ret
            for j in range(len):
                civ[-j - 1] ^= len
    return None


def main():
    r = remote("10.113.184.121", "10031")
    aes_key = dfs_iv(r, encrypted_key, 1, bytearray(b"\x00" * 16))
    print(f"{aes_key = }")
    iv = dfs_iv(r, encrypted_iv, 1, bytearray(b"\x00" * 16))
    print(f"{iv = }")
    cipher = AES.new(aes_key, AES.MODE_CBC, iv)
    pt = cipher.decrypt(
        open("encrypted_flag.not_png", "rb").read(),
    )
    open("flag.png", "wb").write(pt)


if __name__ == "__main__":
    main()
