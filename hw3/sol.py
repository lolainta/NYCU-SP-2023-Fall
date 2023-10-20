from data import sbox, traces
import numpy as np
from multiprocessing import Pool
import os


def main():
    with Pool(os.cpu_count()) as p:
        res = p.map(
            lambda i: (
                np.argmax(
                    [
                        [
                            np.corrcoef(
                                [
                                    (sbox[pt[i] ^ k]).bit_count()
                                    for pt in [trace["pt"] for trace in traces]
                                ],
                                real,
                            )[0, 1]
                            for real in [
                                [traces[j]["pm"][ts] for j in range(len(traces))]
                                for ts in range(1806)
                            ]
                        ]
                        for k in range(128)
                    ]
                )
                // 1806
            ),
            range(16),
        )

    ans = bytearray(16)
    for i, k in enumerate(res):
        ans[i] = k
    print(ans)
    print(f"FLAG{{{ans.decode()}}}")


if __name__ == "__main__":
    main()
