from data import sbox, traces
import numpy as np


def main():
    ans = b""
    print(f"Number of traces: {len(traces)}")
    for trace in traces:
        assert len(trace) == 3
        assert len(trace["pt"]) == 16
        assert len(trace["ct"]) == 16
        assert len(trace["pm"]) == 1806
    assert len(sbox) == 256
    for i in range(16):
        cors = []
        for k in range(128):  # assume printable ascii
            exp = [
                (sbox[pt[i] ^ k]).bit_count()
                for pt in [trace["pt"] for trace in traces]
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
        ans += chr(idx // 1806).encode()
    print(ans)


if __name__ == "__main__":
    main()
