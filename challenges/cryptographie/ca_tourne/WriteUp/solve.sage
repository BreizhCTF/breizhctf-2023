from pwn import remote
from Crypto.Util.number import long_to_bytes, getPrime, isPrime

r = remote("catourne.ctf.bzh",int(30012))

a = int(r.recvline().split(b" = ")[1].decode())
b = int(r.recvline().split(b" = ")[1].decode())
p = int(r.recvline().split(b" = ")[1].decode())
r.recvuntil(b": ")

while True:
	l = [getPrime(20) for _ in range(100)]
	p_ = 2*prod(l)+1
	if isPrime(p_) and len(bin(p_)[2:]) < 2048:
		break

a_inv = pow(a,-1,p)

s = p_

for _ in range(2023):
	s = ((s - b) * a_inv) % p

r.sendline(str(s).encode())

r.recvuntil(b": ")

h = int(r.recvline().decode())

H = GF(p_)(h)
G = GF(p_)(2)

flag = discrete_log(H,G)

print(long_to_bytes(flag).decode())