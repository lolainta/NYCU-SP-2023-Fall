from Crypto.Util.number import getPrime, isPrime, long_to_bytes
from pwn import remote
from sage.all import *

print("Solving discrete log problem")


def gen_sprime():
    n = 2
    while True:
        if n.bit_length() > 1024:
            n = 2
        if n.bit_length() == 1024:
            # print(f"n = {n}")
            if isPrime(n + 1):
                return n + 1
            else:
                n = 2
        n *= getPrime(10)


def main():
    p = gen_sprime()
    # p = 120878978987917035062306416450783436793199010617377911266481872285279503153116048084408325359870553562964766483814781426579331948127031143244276158202066802331366148730086478907229026295850695575958518376998463361273723850182149518888749023439811850176645943714187979052782473636378955998560157298975285057787
    # print(f"p = {p}")
    r = remote("10.113.184.121", "10032")
    r.sendlineafter(b"give me a prime:", str(p).encode())
    r.sendlineafter(b"give me a number:", str(7).encode())
    ret = r.recvline().decode()
    m = int(ret.lstrip("The hint about my secret:").strip())
    # print(f"m = {m}")

    flag = discrete_log(Mod(m, p), Mod(7, p))
    # print(f"flag = {flag}")
    print(long_to_bytes(flag))


if __name__ == "__main__":
    main()
