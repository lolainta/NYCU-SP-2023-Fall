from data import sbox, traces
import numpy as np
from tqdm import trange
from multiprocessing import Pool
import os

ans = bytearray(16)


def worker(i):
    cors = []
    for k in range(128):  # assume printable ascii
        exp = [
            (sbox[pt[i] ^ k]).bit_count() for pt in [trace["pt"] for trace in traces]
        ]
        assert len(exp) == len(traces)  # 50
        reals = [
            [traces[j]["pm"][ts] for j in range(len(traces))] for ts in range(1806)
        ]
        assert len(reals) == 1806
        assert len(reals[0]) == len(exp)
        kcor = [np.corrcoef(exp, real)[0, 1] for real in reals]
        assert len(kcor) == 1806
        cors.append(kcor)
    cors = np.array(cors)
    idx = np.argmax(cors.flatten())
    print(f"{i=} {idx=} k={idx//1806}={chr(idx//1806).encode()}, ts={idx%1806}")
    ans[i] = idx // 1806


def main():
    ans = b""
    print(f"Number of traces: {len(traces)}")
    for trace in traces:
        assert len(trace) == 3
        assert len(trace["pt"]) == 16
        assert len(trace["ct"]) == 16
        assert len(trace["pm"]) == 1806
    assert len(sbox) == 256
    with Pool(os.cpu_count()) as p:
        p.map(worker, range(16))

    print(ans)
    print(f"FLAG{{{ans.decode()}}}")


if __name__ == "__main__":
    main()
