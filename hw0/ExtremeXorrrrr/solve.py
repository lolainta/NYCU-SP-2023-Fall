from functools import reduce
from Crypto.Util.number import long_to_bytes

hint = [
    297901710,
    2438499757,
    172983774,
    2611781033,
    2766983357,
    1018346993,
    810270522,
    2334480195,
    154508735,
    1066271428,
    3716430041,
    875123909,
    2664535551,
    2193044963,
    2538833821,
    2856583708,
    3081106896,
    2195167145,
    2811407927,
    3794168460,
]
muls = [
    865741,
    631045,
    970663,
    575787,
    597689,
    791331,
    594479,
    857481,
    797931,
    1006437,
    661791,
    681453,
    963397,
    667371,
    705405,
    684177,
    736827,
    757871,
    698753,
    841555,
]
mods = [
    2529754263,
    4081964537,
    2817833411,
    3840103391,
    3698869687,
    3524873305,
    2420253753,
    2950766353,
    3160043859,
    2341042647,
    4125137273,
    3875984107,
    4079282409,
    2753416889,
    2778711505,
    3667413387,
    4187196169,
    3489959487,
    2756285845,
    3925748705,
]
k = len(hint)


def revXorrrrr(lst):
    sum = reduce(lambda x, y: x ^ y, lst)
    return [sum ^ l for l in lst]


# solve ax+by=gcd(a,b)
def extgcd(a, b) -> tuple[int, int]:
    if b == 0:
        return (1, 0)
    else:
        x, y = extgcd(b, a % b)
        return (y, x - a // b * y)


def CRT(a, x):
    k = len(a)
    M = reduce(lambda x, y: x * y, a)
    M_i = [M // a[i] for i in range(k)]
    M_i_inv = [extgcd(M_i[i], a[i])[0] for i in range(k)]
    x_ = [M_i[i] * M_i_inv[i] * x[i] for i in range(k)]
    return sum(x_) % M


hint = revXorrrrr(hint)
muls = revXorrrrr(muls)
mods = revXorrrrr(mods)

rems = [hint[i] * extgcd(muls[i], mods[i])[0] for i in range(k)]
rems = [rems[i] % mods[i] for i in range(k)]
secret = CRT(mods, rems)

print(long_to_bytes(secret))
