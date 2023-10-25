from sage.all import *
from pwn import remote
from Crypto.Util.number import isPrime, long_to_bytes
from elliptic_curve import Curve, Point
from random import randint
from tqdm import tqdm
from data import p, a, b, n


# nc 10.113.184.121 10034.
def send_point(p):
    r = remote("10.113.184.121", "10034", level="error")
    r.recvline()
    r.recvuntil(b"Gx: ")
    r.sendline(str(p[0]).encode())
    r.recvuntil(b"Gy: ")
    r.sendline(str(p[1]).encode())
    ret = r.recvline()
    if b"Traceback" in ret:
        # r.interactive()
        r.close()
        return None
    # print(ret)
    try:
        x = int(ret[1 : ret.find(b",")])
        y = int(ret[ret.find(b",") + 2 : -2])
    except:
        if ret != b"INF\n":
            print(ret)
        return None
    r.close()
    # print(f"{x = } {y = }")
    return (x, y)


def gen_fake():
    bb = -4 * pow(a, 3, p) * pow(27, -1, p) % p
    assert bb == 4
    return 2
    # find b such that 4a^3 + 27b^2 = 0 (mod p)
    # b^2 = 4a^3 / 27
    # print(isPrime(p))
    phi_p = (
        115792089210356248762697446949407573530086143415290314195533631308867097853950
    )
    # R = IntegerModRing(p)
    # d = pow(2, -1, phi_p)
    d = phi_p // 2
    tmp = 123456789
    assert pow(tmp, phi_p, p) == 1
    assert pow(tmp, d * 2, p) == 1
    assert bb == 4
    print(f"{bb = } {d = }")
    b = pow(bb, d, p)
    print(f"{b = }")
    return 2
    assert 4 * pow(a, 3, p) + 27 * pow(b, 2, p) % p == 0, f"{a = } {b = }"
    print(f"{b = }")
    return b


def phi(x, y):
    alpha = 1
    beta = -2
    t = GF(p)(alpha - beta).sqrt()
    print(f"{t = }")
    u = y + t * x
    v = y - t * x
    return u / v


def attack(Gx, Gy, Px, Py):
    x = GF(p)["x"].gen()
    print(f"{x = }")
    f = x**3 - 3 * x + 2
    roots = f.roots()
    print(f"{roots = }")

    # Singular point is a cusp.
    if len(roots) == 1:
        alpha = roots[0][0]
        u = (Gx - alpha) / Gy
        v = (Px - alpha) / Py
        return int(v / u)

    # Singular point is a node.
    if len(roots) == 2:
        if roots[0][1] == 2:
            alpha = roots[0][0]
            beta = roots[1][0]
        elif roots[1][1] == 2:
            alpha = roots[1][0]
            beta = roots[0][0]
        else:
            raise ValueError("Expected root with multiplicity 2.")

        t = (alpha - beta).sqrt()
        print(f"{t = }")
        u = (Gy + t * (Gx - alpha)) / (Gy - t * (Gx - alpha))
        v = (Py + t * (Px - alpha)) / (Py - t * (Px - alpha))
        return discrete_log(v, u)
    raise ValueError(f"Unexpected number of roots {len(roots)}.")


def test():
    while True:
        # y^2 = x^3 - 3 * x + 2
        # y^2 = (x - 1)^2 * (x + 2)

        # y^2 = x^3 - 3 * x + 3

        # bb =  4
        # gx, gy = 0 % p, 2 % p

        # E1 = Curve(p, a, bb)
        # hx, hy = send_point([gx, gy])

        # G1 = Point(E1, gx, gy)
        assert (gx ^ 3 + a * gx + bb - gy ^ 2) % p == 0
        # pg = phi(gx, gy)
        # ph = phi(hx, hy)
        # print(f"{pg = }\n{ph = }")
        # d = attack(gx, gy, hx, hy)
        # print(f"{d = }")
        # return
        # discrete_log(pg, ph, operation="+")
        F = Zmod(p)
        E1 = EllipticCurve(F, [a, b])
        G1 = E1.gens()[0]
        print(f"{G1 = }")
        print(f"{G1.order() = }")
        print(f"{factor(G1.order()-1) = }")
        print(f"{factor(G1.order()-1)[-1][0].bit_length() = }")
        return
        G1 = E1(F(gx), F(gy))
        # print(f"{G1 = }")
        order1 = G1.order()
        print(order1.factor())
        print(f"{order1.factor()[-1][0].bit_length() = }")
        ret = send_point(G1)
        if ret is None:
            continue
        hx, hy = ret

        print(f"{hx = } {hy = }")
        # E2 = EllipticCurve(Zmod(p), [a, b])
        # G2 = E1.gens()[0]
        K = E1(hx, hy)
        d = discrete_log(K, G1, operation="+")
        print(f"{d = }")
        return
        E2 = EllipticCurve(Zmod(p), [a, b])
        G2 = E2.gens()[0]
        d = discrete_log(hint, G2, operation="+")
        print(f"{d = }")
        # order2 = G2.order()
        # assert order2 == n
        # d = G2.discrete_log(hint)
        # print(f"{d = }")
        # break


def test2(bb):
    # bb = 5
    F = Zmod(p)
    E = EllipticCurve(F, [a, bb])
    G = E.gens()[0]
    n = G.order()
    fac = G.order().factor()
    print(f"{fac = }")
    print(f"{fac[-1][0].bit_length() = }")
    C = Curve(p, a, bb)
    P = Point(C, G[0], G[1])
    print(f"{P = }")
    print(f"{G[0] = } {G[1] = }")

    val, mod = [], []
    for f, e in fac:
        order = f**e
        if order.bit_length() > 40:
            print(f"{order = } {order.bit_length() = } too long")
            continue
        base = n // order
        final = base * P
        gx, gy = final.x, final.y
        ret = send_point([gx, gy])
        if ret is None:
            continue
        hx, hy = ret
        # print(f"{gx = } {gy = }")
        cur = final
        # for t in trange(1, order+2):
        #     # print(f"{cur.x = } {cur.y =}")
        #     if cur == Point(C, hx, hy):
        #         print(f"{t = }")
        #         val.append(t)
        #         mod.append(order)
        #         break
        #     cur += final
        # else:
        #     raise ValueError("Not found.")
        t = discrete_log(E(F(hx), F(hy)), E(F(gx), F(gy)), ord=order, operation="+")
        print(f"{base = } {order = } {order.bit_length() = } {t = }")
        val.append(t)
        mod.append(order)
    print(val, mod)
    flag = crt(val, mod)
    print(f"{flag = }")
    print(long_to_bytes(flag))
    return val, mod


def get_hint(bb, vals, mods):
    # tqdm.write(f"{bb = }")
    F = Zmod(p)
    E = EllipticCurve(F, [a, bb])
    G = E.gens()[0]
    n = G.order()
    fac = G.order().factor()
    # tqdm.write(f"{fac = }")
    C = Curve(p, a, bb)
    P = Point(C, G[0], G[1])
    for f, e in fac:
        order = f**e
        if order.bit_length() > 45:
            # tqdm.write(f"{order=} {order.bit_length()=} too long")
            continue
        base = n // order
        final = base * P
        gx, gy = final.x, final.y
        ret = send_point([gx, gy])
        if ret is None:
            continue
        hx, hy = ret
        t = discrete_log(E(F(hx), F(hy)), E(F(gx), F(gy)), ord=order, operation="+")
        # tqdm.write(f"{base=} {order=} {order.bit_length()=} {t=}")
        if t not in vals:
            vals.append(t)
            mods.append(order)
    flag = crt(vals, mods)
    # tqdm.write(f"{vals = }")
    # tqdm.write(f"{mods = }")
    # tqdm.write(f"{flag = }")
    # tqdm.write(str(long_to_bytes(flag)))
    if long_to_bytes(flag).startswith(b"FLAG"):
        tqdm.write(str(long_to_bytes(flag)))
        return True
    return False


def main():
    vals, mods = [125], [256]
    for i in range(20):
        if i == 2:
            continue
        if get_hint(i, vals, mods):
            break


if __name__ == "__main__":
    main()
