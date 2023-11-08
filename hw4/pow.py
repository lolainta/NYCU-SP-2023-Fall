import hashlib
from datetime import datetime


def solve_pow(prefix):
    print("[*] Solving pow ...", datetime.now())
    solved = b""
    for i in range(1000000000):
        h = hashlib.sha1((prefix + str(i)).encode()).hexdigest()
        if h[:6] == "000000":
            solved = str(i).encode()
            print("[+] solved =", solved, datetime.now())
            break

    return solved


prefix = input("Please enter the prefix from service:")
solve_pow(prefix)
