from Crypto.Util.number import getPrime, bytes_to_long, long_to_bytes

p, q = getPrime(128), getPrime(128)

flag = b"abc123"
N = p * q
e = 65537
d = pow(e, -1, (p - 1) * (q - 1))

flag_enc = pow(bytes_to_long(flag), e, N)
print(f"{long_to_bytes(pow(flag_enc, d, N)) = }")
sflag_enc = flag_enc * pow(256, e, N) % N
print(f"{long_to_bytes(sflag_enc) = }")
sflag = pow(sflag_enc, d, N)
print(f"{long_to_bytes(sflag) = }")
