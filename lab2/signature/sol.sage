from pwn import remote
from hashlib import sha256
from Crypto.Util.number import bytes_to_long
from ecdsa import SECP256k1
from ecdsa.ecdsa import Public_key, Private_key, Signature

E = SECP256k1
G, n = E.generator, E.order

# nc 10.113.184.121 10033.
r = remote("10.113.184.121", "10033")


def mode1(r, msg):
    r.recvuntil(b"3) exit")
    r.sendline(b"1")
    r.recvuntil(b"What do you want? ")
    r.sendline(msg)
    r.recvuntil(b"sig = (")
    rr = int(r.recvuntil(b", ").strip(b", ").decode())
    rs = int(r.recvuntil(b")").strip(b")").decode())
    return rr, rs, bytes_to_long(sha256(msg).digest())


def mode2(r, sr, ss):
    r.recvuntil(b"3) exit")
    r.sendline(b"2")
    r.recvuntil(b"r: ")
    r.sendline(str(sr).encode())
    r.recvuntil(b"s: ")
    r.sendline(str(ss).encode())
    ret = r.recvline().decode().strip()
    print(ret)
    verified = "Bad signature" not in ret
    return verified


def inv(x, n):
    return pow(x, -1, n)


def sol(r1, s1, h1, r2, s2, h2):
    numer = inv(s2, n) * h2 - 1337 * inv(s1, n) * h1
    denom = 1337 * inv(s1, n) * r1 - inv(s2, n) * r2
    ans = numer * inv(denom, n) % n
    print(ans)
    # F.<k1,k2,d> = GF(n)
    # F.<
    k1, k2, d = var("k1 k2 d")
    eq1 = k1 == k2 * 1337
    eq2 = k1 == s1 ^ -1 * (h1 + d * r1)
    eq3 = k2 == s2 ^ -1 * (h2 + d * r2)
    sol = solve([eq1, eq2, eq3], (k1, k2, d), domain=GF(n))
    print(sol)

    tmp = sol[0][2].rhs()
    print(type(tmp))
    # print(isinstance(integer_value, tmp))
    print(GF(n)(tmp))
    return ans
    return GF(n)(tmp)

    # k1 = s1^-1 * (h1 + d * r1) mod n
    # 1337 * k1 = s2^-1 * (h2 + d * r2) mod n

    # 1337 * k1 = 1337 * s1^-1 * (h1 + d * r1) mod n
    # 1337 * k1 = s2^-1 * (h2 + d * r2) mod n

    # 1337 * s1^-1 * (h1 + d * r1) = s2^-1 * (h2 + d * r2) mod n
    # 1337 * s1^-1 * (h1 + d * r1) - s2^-1 * (h2 + d * r2) = 0 mod n

    # 1337 * s1^-1 * h1 + 1337 * s1^-1 * d * r1 - s2^-1 * h2 - s2^-1 * d * r2 = 0 mod n
    # 1337 * s1^-1 * d * r1 - s2^-1 * d * r2 = s2^-1 * h2 - 1337 * s1^-1 * h1
    # d = (s2^-1 * h2 - 1337 * s1^-1 * h1) / (1337 * s1^-1 * r1 - s2^-1 * r2) mod n
    numer = inv(s2, n) * h2 - 1337 * inv(s1, n) * h1
    denom = 1337 * inv(s1, n) * r1 - inv(s2, n) * r2
    return numer * inv(denom, n) % n


def main():
    pub = r.recvline().decode().strip()[5:-1].split(", ")
    x, y = map(int, pub)
    hello = b"Hello, world!"
    r1, s1, h1 = mode1(r, hello)
    r2, s2, h2 = mode1(r, hello)
    d = sol(r1, s1, h1, r2, s2, h2)

    pubKey = Public_key(G, d * G)
    assert pubKey.point.x() == x and pubKey.point.y() == y, "Wrong d"

    msg = "Give me the FLAG."
    h = bytes_to_long(sha256(msg.encode()).digest())
    k = 48763
    sig = Private_key(pubKey, d).sign(h, k)
    mode2(r, sig.r, sig.s)


if __name__ == "__main__":
    main()
