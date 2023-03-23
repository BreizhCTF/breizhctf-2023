from random import randint, sample
from Crypto.Util.number import isPrime, bytes_to_long

flag = b"REDACTED"

def getSecurePrime(sieve):
    while True:
        l = sample(sieve,33)
        p = 2
        for f in l:
            p*=f
        if isPrime(p+1):
            return p+1

class LFSR:
    def __init__(self):
        self._s = [randint(0,1) for _ in range(56)]
        self._t = [0,2,20,23,55]
        for _ in range(randint(56,2023)):
            self._clock()

    def _clock(self):
        b = self._s[0]
        c = 0
        for t in self._t: c ^= self._s[t]
        self._s = self._s[1:] + [c]
        return b

    def stream(self, length):
        return [self._clock() for _ in range(length)]

rng = LFSR()

sieve = [int("".join(list(map(str, rng.stream(20)))),2) for _ in range(100)]

assert len(set(sieve)) == 100

p = getSecurePrime(sieve)
q = getSecurePrime(sieve)

n = p*q

print(f"n = {n}")
print(f"c = {pow(bytes_to_long(flag),0x10001,n)}")
