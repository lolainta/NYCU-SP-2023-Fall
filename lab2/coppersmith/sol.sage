from sage.all import *
from data import e, n, ct, padding
from Crypto.Util.number import long_to_bytes, bytes_to_long

def main():
    R = 1<<(8*30)
    F.<x> = PolynomialRing(Zmod(n))
    f = (x + bytes_to_long(padding)*R) ** e - ct
    root = int(f.small_roots(X=R)[0])
    print(long_to_bytes(root))

if __name__ == "__main__":
    main()

