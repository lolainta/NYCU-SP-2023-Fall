from sage.all import *
from Crypto.Util.number import long_to_bytes, bytes_to_long
from hashlib import sha256
from ecdsa import SECP256k1
from ecdsa.ecdsa import Public_key
from data import sig1, sig2, P

h1 = sha256(b"https://www.youtube.com/watch?v=IBnrn2pnPG8").digest()
h2 = sha256(b"https://www.youtube.com/watch?v=1H2cyhWYXrE").digest()

h1 = bytes_to_long(h1)
h2 = bytes_to_long(h2)

E = SECP256k1
G, od = E.generator, E.order


def lat(s1, s2, r1, r2, h1, h2, n):
    tt = -s2 * r1 * pow(s1 * r2, -1, n) % n
    uu = (h2 * r1 * pow(s1 * r2, -1, n) - h1 * pow(s1, -1, n)) % n
    shft = 1 << (8 * 16)
    t = (shft * tt + 1) * pow(shft + tt, -1, n) % n
    u = uu * pow(shft + tt, -1, n) % n
    n, t, u = map(int, [n, t, u])
    # M = matrix([[n, t, u], [0, 1, 0], [0, 0, shft]])
    M = matrix([[n, 0, 0], [t, 1, 0], [u, 0, shft]])
    return matrix(M).LLL()


def check(s1, s2, r1, r2, h1, h2, n, m1, m2):
    shft = 1 << (8 * 16)
    d1 = (
        ((m1 + m2) * (shft + 1) - (h1 * pow(s1, -1, n) + h2 * pow(s2, -1, n)))
        * pow((r1 * pow(s1, -1, n) + r2 * pow(s2, -1, n)), -1, n)
        % n
    )
    d2 = (
        ((m1 - m2) * (shft - 1) - (h1 * pow(s1, -1, n) - h2 * pow(s2, -1, n)))
        * pow((r1 * pow(s1, -1, n) - r2 * pow(s2, -1, n)), -1, n)
    ) % n
    if d1 == d2:
        fid = long_to_bytes(d1).find(b"FLAG")
        if fid != -1:
            print(long_to_bytes(d1)[fid:])
            exit()


def main():
    r1, s1 = sig1
    r2, s2 = sig2

    l = lat(s1, s2, r1, r2, h1, h2, od)
    print(l)

    drift = 3
    for i in range(-drift, drift + 1):
        for j in range(-drift, drift + 1):
            for k in range(-drift, drift + 1):
                cur = i * l[0] + j * l[1] + k * l[2]
                m1 = -cur[0]
                m2 = cur[1]
                if m1 < 0 or m2 < 0:
                    continue
                check(s1, s2, r1, r2, h1, h2, od, m1, m2)


if __name__ == "__main__":
    main()
