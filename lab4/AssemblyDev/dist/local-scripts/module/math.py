from os import urandom


def mask(size=8):
    return (1 << (8 * size)) - 1


def get_rand(size=8):
    return int.from_bytes(urandom(size), 'little')

def u2signed(a, size=8):
    tmp = int.to_bytes(a, size, 'little')
    return int.from_bytes(tmp, 'little', signed=True)

def add(a, b, size=8):
    return (a + b) & mask(size)


def sub(a, b, size=8):
    return (a - b) & mask(size)


def neg(a, size=8):
    return add(a ^ mask(size), 1, size)


def mul(a, b, size=8):
    return (a * b) & mask(size)

def div(a, b, size=8):
    return (a // b) & mask(size)

def is_odd(a):
    return a & 1
