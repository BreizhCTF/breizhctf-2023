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