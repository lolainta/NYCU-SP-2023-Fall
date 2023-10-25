from Crypto.Util.number import bytes_to_long, long_to_bytes
from pwn import remote, process
from Crypto.Cipher import AES
from math import lcm, log, ceil
from tqdm import tqdm


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
    return pow(bytes_to_long(padded_message), e, N)


def symmetric_encryption(message, key, iv):
    # ecrypt message with AES + CBC Mode
    # message can be arbitrary length
    cipher = AES.new(key, AES.MODE_CBC, iv=iv)
    ct = cipher.encrypt(pad(message))
    iv = cipher.iv
    return iv, ct


def valid(r, key, iv, ct):
    assert isinstance(key, int)
    assert isinstance(iv, int)
    assert isinstance(ct, bytes)
    r.recvuntil(b"Give me the encrypted key: ")
    r.sendline(str(key).encode())
    r.recvuntil(b"Give me the encrypted iv: ")
    r.sendline(str(iv).encode())
    r.recvuntil(b"Give me the ciphertext: ")
    r.sendline(ct.hex().encode())

    # aes_key = r.recvline().decode().strip()
    # aiv = r.recvline().decode().strip()
    # print(aes_key, aiv)

    # pt = r.recvline().decode().strip()
    # print(pt)
    ret = r.recvline().decode()
    if ret == "OK! Got it.\n":
        return True
    elif ret == "I do not understand.\n":
        return False
    else:
        print(key, iv, ct)
        assert False, ret


from data import encrypted_flag, N, e
from tqdm import trange
from copy import deepcopy


def dfs_key(r, len, key):
    print("    " * len, key)
    if len == 16:
        return
    key = bytearray(b"\x00" + deepcopy(key)[:-1])
    sflag = encrypted_flag % (256 ** (len + 1))
    # print("    " * len, 68, sflag)
    # sflag = encrypted_flag * pow(256 ** (15 - len), e, N) % N
    for i in range(32, 127):
        key[-(len + 1)] = i
        iv, ct = symmetric_encryption(b"Hello, world!", key, b"a" * 16)
        iv_enc = pow(bytes_to_long(iv), e, N)
        if valid(r, sflag, iv_enc, ct):
            print(f"{'    '*len} {i = }, {key = }, {iv = }")
            dfs_key(r, len + 1, key)
    print(f"{'    '*len} fail {len = }")


def dfs_iv1(r, idx, iv):
    print("    " * (15 - idx), idx, iv)
    if idx == 0:
        return
    civ = deepcopy(iv)
    for i in range(idx + 1, 16):
        civ[i] ^= 16 - idx
    for i in range(256):
        civ[idx] = i
        # print("    " * (15 - idx), iv)
        civ_enc = pow(bytes_to_long(civ), e, N)
        key = bytearray(b"\x01" * 16)
        key_enc = asymmetric_encryption(key, N, e)
        _, ct = symmetric_encryption(b"0", key, b"\x00" * 16)
        if valid(r, key_enc, civ_enc, ct):
            print(f"{'    '*(15-idx)} {i = }, {civ = } ")
            for j in range(idx, 16):
                civ[j] ^= 16 - idx
            dfs_iv1(r, idx - 1, civ)
            for j in range(idx, 16):
                civ[j] ^= 16 - idx


def test2():
    # r = remote("10.113.184.121", "10031")
    r = process("./Alice_efe9e435de6947a4.py")
    iv_enc = encrypted_flag
    pt = b"Hello, "
    key = bytearray(b"\x01" * 16)
    iv, ct = symmetric_encryption(pt, key, b"\x00" * 16)
    print(
        valid(
            r,
            asymmetric_encryption(key, N, e),
            asymmetric_encryption(iv, N, e),
            ct,
        ),
    )
    # dfs_iv(r, 15, iv)
    exit()
    for i in range(16):
        print(f"{i = }")
        # print(f"{long_to_bytes(pow())}")
        sflag = encrypted_flag * pow(256 ** (15 - i), e, N) % N
        print(f"{i = }, {sflag = }")
        for j in trange(256):
            key[0] = j
            iv, ct = symmetric_encryption(pt, key, iv)
            assert iv == b"a" * 16
            if valid(r, sflag, iv_enc, ct):
                print(f"{j = }, {key = }, {iv = }, {ct = }")
                key = bytearray(b"\x00" + key[:-1])

                break
        else:
            assert False
        # assert cnt == 1, f"{cnt = } {i = }"
        # break


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


def dfs_iv(r, enc_flag, len, iv) -> None | bytearray:
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


def bs(r, enc_flag, enc_flag_iv, dep, lb, ub):
    if lb >= ub:
        return lb, ub
    print(f"{lb = }\n{ub = }")
    print(f"{dep = }")
    print(long_to_bytes(lb))
    print(long_to_bytes(ub))
    mid = (lb + ub) // 2
    if pow(mid, e, N) == enc_flag:
        return mid
    # s = lcm(N - 1, mid) // mid
    s = dep
    print(f"{hex(s) = }")
    ref = enc_flag * pow(s, e, N)
    # enc_flag_iv = dfs_iv(r, enc_flag, 1, bytearray(b"\x00" * 16))
    assert (m := dfs_iv(r, ref, 1, bytearray(b"\x00" * 16)))
    l2 = long_to_bytes(
        (bytes_to_long(enc_flag_iv) * s) & 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    )
    print(bin(bytes_to_long(enc_flag_iv)))
    print(bin(bytes_to_long(l2)))
    print(bin(bytes_to_long(m)))
    if m == l2:
        return bs(r, enc_flag, enc_flag_iv, dep * 2, lb, mid)
    else:
        return bs(r, enc_flag, enc_flag_iv, dep * 2, mid, ub)


def test1():
    # r = process("./Alice_efe9e435de6947a4.py")
    r = remote("10.113.184.121", "10031")

    enc_flag_iv = dfs_iv(r, encrypted_flag, 1, bytearray(b"\x00" * 16))
    lb = 0
    ub = 120067165409052579590979813804786389645428459084592600613571527945691460668561837075561844470986545418320989449083575047483601717898546615481321736134309512230505430409559131581619248906459477283707107189273492690289693817836263560413634392486066586434862896137911570990867690642593900039347
    dep = 1152921504606846976
    print(long_to_bytes(lb))
    print(long_to_bytes(ub))
    print(bs(r, encrypted_flag, enc_flag_iv, dep, lb, ub))
    # key = b"\x00" * 16
    # iv = b"\x00" * 16
    # cipher = AES.new(key, AES.MODE_CBC, iv)
    # pt = b"\x02" * 16
    # # print(pt[-1])
    # ct = cipher.encrypt(pt)

    # # print(len(ct), ct.hex())
    # key_enc = asymmetric_encryption(key, N, e)
    # iv_enc = asymmetric_encryption(iv, N, e)
    # # print(key_enc, iv_enc, ct.hex())
    # print(valid(r, key_enc, encrypted_flag, ct))


def test3():
    r = remote("10.113.184.121", "10031")
    # r = process("./Alice_efe9e435de6947a4.py")
    # print(dfs_iv(r, encrypted_flag, 1, bytearray(b"\x00" * 16)))
    # sfg = dfs_iv(
    #     r,
    #     encrypted_flag * pow(256, 15 * e, N) % N,
    #     1,
    #     bytearray(b"\x00" * 16),
    # )
    sfg = b"s%\x17iVg\xe3\x05\x10\xbdc5l7\x9b|"
    print(sfg)
    fg = bytes_to_long(sfg)
    fg = fg * pow(256, -15 * e, N) % N
    for i in range(15):
        print(long_to_bytes(fg))
        fg += N


def main():
    r = remote("10.113.184.121", "10031")

    enc = encrypted_flag

    mod = 2**128
    mod_inv = pow(mod, -1, N)
    mod_inv_e = pow(mod, -e, N)
    ans = 0
    cnt = 1
    rem = 0

    with tqdm(total=ceil(log(N, mod))) as pbar:
        while cnt <= N:
            assert (ret := dfs_iv(r, enc, 1, bytearray(b"\x00" * 16)))
            ret = bytes_to_long(ret)
            x = (ret - rem) % mod
            ans += x * cnt
            # print(long_to_bytes(ans))

            enc = (enc * mod_inv_e) % N
            rem = (rem + x) * mod_inv % N
            cnt *= mod
            pbar.update(1)
    # print(ans)
    print(long_to_bytes(ans))


if __name__ == "__main__":
    main()
