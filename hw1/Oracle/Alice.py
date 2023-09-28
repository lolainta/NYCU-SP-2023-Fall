#!/usr/bin/env python3
from Crypto.Util.number import long_to_bytes
from Crypto.Cipher import AES
from secret import p, q

import signal


def alarm(second):
    def handler(signum, frame):
        print("Timeout!")
        exit()

    signal.signal(signal.SIGALRM, handler)
    signal.alarm(second)


def pad(m):
    length = 16 - len(m) % 16
    return m + chr(length).encode() * length


def unpad(c):
    length = c[-1]
    for char in c[-length:]:
        if char != length:
            raise ValueError
    return c[:-length]


## Alice: Okay! AES with CBC mode. I know it.
if __name__ == "__main__":
    N = p * q
    e = 65537
    d = pow(e, -1, (p - 1) * (q - 1))
    while True:
        alarm(100)
        try:
            encrypted_key = int(input("Give me the encrypted key: "))
            encrypted_iv = int(input("Give me the encrypted iv: "))
            ct = bytes.fromhex(input("Give me the ciphertext: "))

            # decrypt asymmetric_encryption()
            print(long_to_bytes(pow(encrypted_key, d, N)))
            aes_key = long_to_bytes(pow(encrypted_key, d, N))[-16:]
            iv = long_to_bytes(pow(encrypted_iv, d, N))[-16:]
            print(f"{aes_key = }")
            print(f"{iv = }")
            # decrypt symmetric_encryption()
            cipher = AES.new(aes_key, AES.MODE_CBC, iv)
            pt = unpad(cipher.decrypt(ct))
            print("OK! Got it.")

        except ValueError:
            print("I do not understand.")

        except:
            print("Bye~~")
            break
