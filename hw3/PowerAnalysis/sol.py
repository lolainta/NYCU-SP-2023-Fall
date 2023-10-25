from data import sbox, traces
import numpy as np
from tqdm import trange


def main():
    print(
        "FLAG{%s}"
        % bytearray(
            [
                (
                    lambda i: (
                        np.argmax(
                            [
                                [
                                    np.corrcoef(
                                        [
                                            (sbox[pt[i] ^ k]).bit_count()
                                            for pt in [tr["pt"] for tr in traces]
                                        ],
                                        real,
                                    )[0, 1]
                                    for real in [
                                        [
                                            traces[j]["pm"][ts]
                                            for j in range(len(traces))
                                        ]
                                        for ts in range(100)
                                    ]
                                ]
                                for k in range(128)
                            ]
                        )
                        // 100
                    )
                )(i)
                for i in trange(16)
            ]
        ).decode()
    )


if __name__ == "__main__":
    main()
