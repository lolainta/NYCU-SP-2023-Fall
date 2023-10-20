from Crypto.Util.number import *
from hashlib import sha256, md5
from ecdsa import SECP256k1
from ecdsa.ecdsa import Public_key, Private_key
from secret import FLAG
import os

E = SECP256k1
G, n = E.generator, E.order
d = bytes_to_long(os.urandom(32 - len(FLAG)) + FLAG)
print(f"{d=}")
pubkey = Public_key(G, d * G)
prikey = Private_key(pubkey, d)

magic1 = md5(d.to_bytes(32, "big")).digest()
magic2 = md5(d.to_bytes(32, "big")[::-1]).digest()
print(f"{magic1=}")
print(f"{magic2=}")

h1 = sha256(b"https://www.youtube.com/watch?v=IBnrn2pnPG8").digest()
h2 = sha256(b"https://www.youtube.com/watch?v=1H2cyhWYXrE").digest()

k1 = bytes_to_long(magic1 + magic2)
k2 = bytes_to_long(magic2 + magic1)
print(f"{long_to_bytes(k1)=}")

sig1 = prikey.sign(bytes_to_long(h1), k1)
sig2 = prikey.sign(bytes_to_long(h2), k2)

print(f"P = ({pubkey.point.x()}, {pubkey.point.y()})")
print(f"sig1 = ({sig1.r}, {sig1.s})")
print(f"sig2 = ({sig2.r}, {sig2.s})")

# P = (70427896289635684269185763735464004880272487387417064603929487585697794861713, 83106938517126976838986116917338443942453391221542116900720022828358221631968)
# sig1 = (26150478759659181410183574739595997895638116875172347795980556499925372918857, 50639168022751577246163934860133616960953696675993100806612269138066992704236)
# sig2 = (8256687378196792904669428303872036025324883507048772044875872623403155644190, 90323515158120328162524865800363952831516312527470472160064097576156608261906)
