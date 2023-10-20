from random import randint
from Crypto.Util.number import *
from hashlib import sha256
from ecdsa import SECP256k1
from ecdsa.ecdsa import Public_key, Private_key, Signature
from secret import FLAG

E = SECP256k1
G, n = E.generator, E.order

d = randint(1, n)
k = randint(1, n)
pubkey = Public_key(G, d * G)
prikey = Private_key(pubkey, d)
print(f"P = ({pubkey.point.x()}, {pubkey.point.y()})")

for _ in range(3):
    print(
        """
1) Request for Signature
2) Check the Permission
3) exit"""
    )
    option = input()
    if option == "1":
        msg = input("What do you want? ")
        if msg == "Give me the FLAG.":
            print("No way!")
        else:
            h = sha256(msg.encode()).digest()
            k = k * 1337 % n
            sig = prikey.sign(bytes_to_long(h), k)
            print(f"sig = ({sig.r}, {sig.s})")

    elif option == "2":
        msg = "Give me the FLAG."
        r = input("r: ")
        s = input("s: ")
        h = bytes_to_long(sha256(msg.encode()).digest())
        verified = pubkey.verifies(h, Signature(int(r), int(s)))
        if verified:
            print(FLAG)
        else:
            print("Bad signature")
    else:
        print("bye~")
        break
