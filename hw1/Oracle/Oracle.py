from Crypto.Util.number import bytes_to_long
from Crypto.Cipher import AES
from random import randbytes
from secret import aes_key, p, q


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
    padded_message = randbytes(100) + message
    return pow(bytes_to_long(padded_message), e, N)


def symmetric_encryption(message, key):
    # ecrypt message with AES + CBC Mode
    # message can be arbitrary length
    cipher = AES.new(key, AES.MODE_CBC)
    ct = cipher.encrypt(pad(message))
    iv = cipher.iv
    return iv, ct


## Alice: This is my public key.
# p = getPrime(512)
# q = getPrime(512)
N = p * q
e = 65537
print(f"{N = }")
print(f"{e = }")
# N = 69214008498642035761243756357619851816607540327248468473247478342523127723748756926949706235406640562827724567100157104972969498385528097714986614165867074449238186426536742677816881849038677123630836686152379963670139334109846133566156815333584764063197379180877984670843831985941733688575703811651087495223
# e = 65537

## Bob: I want to send message to Alice! But my message is too looooooong......
# flag = open("flag.png", "rb").read()
flag = b"flag{This is a fake flag.}"

## Bob: Oh! I can use symmetric encryption.
iv, ct = symmetric_encryption(flag, aes_key)
print(f"{iv = }")
print(f"{ct = }")
print(len(iv), len(ct))
encrypted_key = asymmetric_encryption(aes_key, N, e)
encrypted_iv = asymmetric_encryption(iv, N, e)
print(f"{encrypted_key = }")
print(f"{encrypted_iv = }")
open("encrypted_flag.not_png", "wb").write(ct)

## Bob: Ha ha! Now no one can decrypt my message except Alice!
# encrypted_key = 65690013242775728459842109842683020587149462096059598501313133592635945234121561534622365974927219223034823754673718159579772056712404749324225325531206903216411508240699572153162745754564955215041783396329242482406426376133687186983187563217156659178000486342335478915053049498619169740534463504372971359692
# encrypted_iv = 35154524936059729204581782839781987236407179504895959653768093617367549802652967862418906182387861924584809825831862791349195432705129622783580000716829283234184762744224095175044663151370869751957952842383581513986293064879608592662677541628813345923397286253057417592725291925603753086190402107943880261658
