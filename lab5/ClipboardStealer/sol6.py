def rol(v: int, b: int, bit_size: int):
    return (v << b) | (v >> (bit_size - b)) & (2 ** (bit_size) - 1)


def main():
    with open("./user32.dll.txt", "r") as f:
        data = f.read().split("\n")
    for name in data:
        h = 0
        for i in range(len(name)):
            h += rol(h, 11, 32) + 1187 + ord(name[i])
            h = h & (2 ** (32) - 1)
            if h == 0x416F607:
                print(name)
                break


if __name__ == "__main__":
    main()
