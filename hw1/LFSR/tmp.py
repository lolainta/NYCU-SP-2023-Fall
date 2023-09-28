from data import hint
from Crypto.Util.number import long_to_bytes
from copy import deepcopy
from itertools import combinations
from tqdm import trange


class LFSR:
    def __init__(self, tap, state):
        self._tap = tap
        self._state = state

    def getbit(self):
        f = sum([self._state[i] for i in self._tap]) & 1
        x = self._state[0]
        self._state = self._state[1:] + [f]
        return x


def construct(taps, sz, pow=70):
    mat = []
    for i in range(sz):
        mat.append([0] * sz)
        if i + 1 < sz:
            mat[i][i + 1] = 1
    for tap in taps:
        mat[-1][tap] = 1
    base = deepcopy(mat)

    def mul(a, b):
        return [
            [sum(a * b for a, b in zip(A_row, B_col)) & 1 for B_col in zip(*b)]
            for A_row in a
        ]

    def qpow(a, b):
        ret = [[1 if i == j else 0 for j in range(sz)] for i in range(sz)]
        while b:
            if b & 1:
                ret = mul(ret, a)
            a = mul(a, a)
            b >>= 1
        return ret

    trans = qpow(base, pow)
    return base, trans


sz = 8 * 8
taps = [0, 2, 17, 19, 23, 37, 41, 53]


trans, base = construct(taps, sz)


def main():
    # for i in trange(sz + 1):
    for i in trange(10, 22):
        for c in combinations(range(sz), i):
            cur = [1 if i in c else 0 for i in range(sz)]
            stream = []
            for _ in range(len(hint)):
                cur = [
                    sum([cur[k] * trans[i][k] for k in range(sz)]) & 1
                    for i in range(sz)
                ]
                stream.append(cur[0])
                cur = [
                    sum([cur[k] * base[i][k] for k in range(sz)]) & 1 for i in range(sz)
                ]
            flag = deepcopy(stream)
            for i in range(len(hint)):
                flag[i] ^= hint[i]
            flag = long_to_bytes(int("".join(map(str, flag[:-70])), 2))
            if flag.startswith(b"FLAG"):
                print(flag)
                exit(0)


# from z3 import *

# x = BitVec("x", 64)
# mulmat = qpow(base, 71)

# s = Solver()
