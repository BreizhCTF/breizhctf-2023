from Crypto.Util.number import getPrime, bytes_to_long
from random import randint

flag = b"BZHCTF{cryp70h4ck_b357_cryp70_c0mmun17y}"

p = getPrime(512)

a = randint(1,p)

b = randint(1,p)

s = bytes_to_long(flag)

def get_random(l):
    global a
    global b
    global s
    global p

    outs = []
    for _ in range(l):
        s = (a*s+b) %p
        outs.append(s)

    return outs

A = [randint(1,p) for _ in range(64)]

S = get_random(64)

print(f"a = {a}")
print(f"b = {b}")
print(f"p = {p}")
print(f"result = {sum([aa*ss % p for aa,ss in zip(A,S)])}")
print(f"A = {A}")