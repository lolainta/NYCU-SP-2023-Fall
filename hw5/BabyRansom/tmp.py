def ror(x, n, bits=32):
    mask = (2**n) - 1
    mask_bits = x & mask
    return (x >> n) | (mask_bits << (bits - n))


def main():
    url = "http://M17H+G+4FzeJ69F5.*f)vfquhvnv)*fwdhud)*vf)lpktud)*lj)4)*uk)'Lpfwjvjcu)Rpkejrv)Tyehud')*uw)'$v)uqpvpvuqdvuhwu((')*c.mobm.com"
    for i in range(7, 23):
        v2 = ord(url[i])
        v2 -= 43
        v2 ^= 0x6F
        if v2 > 0:
            print(chr(v2), end="")
    print()
    for i in range(121, 125):
        v3 = ord(url[i])
        v3 -= 80
        v3 ^= 0x7E
        if v3 > 0:
            print(chr(v3), end="")
    print()


if __name__ == "__main__":
    main()
