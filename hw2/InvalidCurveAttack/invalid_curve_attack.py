from elliptic_curve import Curve, Point
from Crypto.Util.number import bytes_to_long
from secret import FLAG

# NIST P-256
p = 0xFFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
a = 0xFFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFC
b = 0x5AC635D8AA3A93E7B3EBBD55769886BC651D06B0CC53B0F63BCE3C3E27D2604B
n = 0xFFFFFFFF00000000FFFFFFFFFFFFFFFFBCE6FAADA7179E84F3B9CAC2FC632551

print("Give me a G and I will give you the hint.")
E = Curve(p, a, b)
Gx = int(input("Gx: "))
Gy = int(input("Gy: "))
G = Point(E, Gx, Gy)
hint = G * bytes_to_long(FLAG)
print(hint)
