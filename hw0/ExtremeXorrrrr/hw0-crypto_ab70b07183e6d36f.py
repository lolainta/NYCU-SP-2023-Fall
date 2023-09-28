from secret import flag
from Crypto.Util.number import bytes_to_long, getPrime

def xorrrrr(nums):
    n = len(nums)
    result = [0] * n
    for i in range(1, n):
        result = [ result[j] ^ nums[(j+i) % n] for j in range(n)]
    return result

secret = bytes_to_long(flag)
mods = [ getPrime(32) for i in range(20)]
muls = [ getPrime(20) for i in range(20)]

hint = [secret * muls[i] % mods[i] for i in range(20)]

print(f"hint = {xorrrrr(hint)}")
print(f"muls = {xorrrrr(muls)}")
print(f"mods = {xorrrrr(mods)}")

# hint = [297901710, 2438499757, 172983774, 2611781033, 2766983357, 1018346993, 810270522, 2334480195, 154508735, 1066271428, 3716430041, 875123909, 2664535551, 2193044963, 2538833821, 2856583708, 3081106896, 2195167145, 2811407927, 3794168460]
# muls = [865741, 631045, 970663, 575787, 597689, 791331, 594479, 857481, 797931, 1006437, 661791, 681453, 963397, 667371, 705405, 684177, 736827, 757871, 698753, 841555]
# mods = [2529754263, 4081964537, 2817833411, 3840103391, 3698869687, 3524873305, 2420253753, 2950766353, 3160043859, 2341042647, 4125137273, 3875984107, 4079282409, 2753416889, 2778711505, 3667413387, 4187196169, 3489959487, 2756285845, 3925748705]
