from Crypto.Util.number import isPrime, bytes_to_long
import os

from secret import FLAG

p = int(input("give me a prime: ").strip())
if not isPrime(p):
    print("Do you know what is primes?")
    exit(0)

if p.bit_length() != 1024:
    print("Bit length need to be 1024")
    exit(0)

g = int(input("give me a number: ").strip())
flag = bytes_to_long(FLAG)

print("The hint about my secret:", pow(g, flag, p))
