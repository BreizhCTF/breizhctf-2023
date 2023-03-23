
# Ca Tourne

## The problem

We are given the source code that runs on the server:
```py
#!/usr/bin/env python3
from random import randint
from Crypto.Util.number import getPrime, isPrime, bytes_to_long
from flag import flag

p = getPrime(2048)
a = randint(1,p)
b = randint(1,p)

print("a =",a)
print("b =",b)
print("p =",p)

s = int(input("Welcome, give me a seed number to create the prime used in our exchange : "))

for _ in range(2023):
	s = (a*s + b) % p
	
assert isPrime(s), "I want a good prime number"

g = 2
f = bytes_to_long(flag)
h = pow(g,f,s)
print("Here is your data, good decryption :",h)
```

## The solution

So we have to send a number that is used as the seed of an lcg, the state after 2023 loops is then used as the prime modulus in a diffie-hellman like encryption.

Our goal is to recover the exponent f knowing ``h = g^f % p``. We can do this if the order of the modulus is smooth, luckily we control the modulus p so we can make it smooth.

To do that we take a list of small prime numbers, we multiply them and add 1, if it's prime then we have our prime number. The next step it only to reverse the lcg part.

Script:
```py
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
```

Flag : BZHCTF{50m3_m1x1n9_0f_1c9_4nd_dh_15_fun_15n7_17_4nd_w31c0m3_1n_7h3_c2yp70_fun}

### Shadowwws
