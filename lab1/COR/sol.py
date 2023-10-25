class LFSR:
    def __init__(self, tap, state):
        self._tap = tap
        self._state = state

    def getbit(self):
        f = sum([self._state[i] for i in self._tap]) & 1
        x = self._state[0]
        self._state = self._state[1:] + [f]
        return x


class triLFSR:
    def __init__(self, lfsr1, lfsr2, lfsr3):
        self.lfsr1 = lfsr1
        self.lfsr2 = lfsr2
        self.lfsr3 = lfsr3

    def getbit(self):
        x1 = self.lfsr1.getbit()
        x2 = self.lfsr2.getbit()
        x3 = self.lfsr3.getbit()
        return x2 if x1 else x3


from tqdm import trange
import itertools
from data import hint


def correlation_attack(stream, key_len):
    for b in trange(key_len):
        for c in itertools.combinations(range(key_len), b):
            key_candidate = [
                1 - stream[i] if i in c else stream[i] for i in range(key_len)
            ]
            lfsr = LFSR([0, 1, 2, 5], key_candidate)
            s = [lfsr.getbit() for _ in range(200)]
            matches = sum(a == b for a, b in zip(stream, s))
            if matches >= 140:
                # print(key_candidate)
                return key_candidate


key2 = correlation_attack(hint, 23)
key3 = correlation_attack(hint, 27)

# key2 = [1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1]
# key3 = [0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1]

lfsr2 = LFSR([0, 1, 2, 5], key2)
lfsr3 = LFSR([0, 1, 2, 5], key3)

lfsr2_stream = [lfsr2.getbit() for _ in range(200)]
lfsr3_stream = [lfsr3.getbit() for _ in range(200)]


def bf():
    for k in trange(1 << 19):
        key_candidate = list(map(int, bin(k)[2:].rjust(19, "0")))
        lfsr = LFSR([0, 1, 2, 5], key_candidate)
        suc = True
        for i in range(200):
            if (lfsr2_stream[i] if lfsr.getbit() else lfsr3_stream[i]) != hint[i]:
                suc = False
                # print("fail", key_candidate)
                break
        if suc:
            # print(key_candidate)
            return key_candidate


key1 = bf()
# key1 = [0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0]
lfsr1 = LFSR([0, 1, 2, 5], key1)
lfsr1_stream = [lfsr1.getbit() for _ in range(200)]
cipher = triLFSR(lfsr1, lfsr2, lfsr3)
flag = []
for o in hint[200:]:
    flag.append(o ^ cipher.getbit())

print(key1)
print(key2)
print(key3)

from Crypto.Util.number import long_to_bytes

print(long_to_bytes(int("".join(map(str, flag)), 2)))
