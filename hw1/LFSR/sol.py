from data import hint
from copy import deepcopy
from tqdm import trange
from Crypto.Util.number import long_to_bytes


def mul(a, b):
    return [
        [sum(a * b for a, b in zip(A_row, B_col)) & 1 for B_col in zip(*b)]
        for A_row in a
    ]


def qpow(a, b):
    ret = [[1 if i == j else 0 for j in range(64)] for i in range(64)]
    while b:
        if b & 1:
            ret = mul(ret, a)
        a = mul(a, a)
        b >>= 1
    return ret


def genmat(base, start, end):
    mat = []
    step = qpow(base, 71)
    cur = qpow(base, (start + 1) * 71 - 1)
    for i in trange(start, end):
        mat.append(cur[0])
        cur = mul(cur, step)
    return mat


def solve(mat, b):
    for i in range(64):
        mat[i].append(b[i])

    def merge(a, b):
        return [a[i] ^ b[i] for i in range(65)]

    for i in range(64):
        if mat[i][i] == 0:
            for j in range(i + 1, 64):
                if mat[j][i] == 1:
                    mat[i], mat[j] = mat[j], mat[i]
                    break
        assert mat[i][i] == 1
        for j in range(i + 1, 64):
            if mat[j][i] == 1:
                mat[j] = merge(mat[i], mat[j])

    for i in range(63, -1, -1):
        for j in range(i - 1, -1, -1):
            if mat[j][i] == 1:
                mat[j] = merge(mat[i], mat[j])
    return [mat[i][64] for i in range(64)]


def resolve(base, key):
    mat = genmat(base, 0, 256)
    return [sum([key[j] * mat[i][j] for j in range(64)]) & 1 for i in range(256)]


def main():
    taps = [0, 2, 17, 19, 23, 37, 41, 53]
    base = [
        [(1 if i + 1 == j or (i == 63 and j in taps) else 0) for j in range(64)]
        for i in range(64)
    ]
    eqs = genmat(base, 256, 256 + 64)
    key = solve(eqs, hint[256 : 256 + 64])
    stream = resolve(base, key)
    flag = long_to_bytes(
        int("".join(map(str, [stream[i] ^ hint[i] for i in range(256)])), 2)
    )
    print(flag)


if __name__ == "__main__":
    main()
