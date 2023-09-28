#! /usr/bin/python3
from Crypto.Cipher import AES
import os

# from secret import FLAG
FLAG = b"FLAG{pAdd1NG_0rAcL3_A77aCK}"


def pad(data, block_size):
    data += bytes([0x80] + [0x00] * (15 - len(data) % block_size))
    return data


# padding style: <oooooo[0x80][0x00]...[0x00]> (find first [0x80])


def unpad(data, block_size):
    if len(data) % block_size:
        raise ValueError

    padding_len = 0
    for i in range(1, len(data) + 1):
        if data[-i] == 0x80:
            padding_len = i
            break
        elif data[-i] != 0x00:
            raise ValueError
    else:
        raise ValueError

    return data[:-padding_len]


key = os.urandom(16)
cipher = AES.new(key, AES.MODE_CBC)
ct = cipher.encrypt(pad(FLAG, AES.block_size))
iv = cipher.iv
print((iv + ct).hex())

# same encryption

while True:
    try:
        inp = bytes.fromhex(input().strip())  # hex style input
        iv, ct = inp[:16], inp[16:]  # get first 16 bytes from input
        cipher = AES.new(key, AES.MODE_CBC, iv)
        pt = unpad(cipher.decrypt(ct), AES.block_size)
        print("Well received :)")
    except ValueError:
        print("Something went wrong :(")
