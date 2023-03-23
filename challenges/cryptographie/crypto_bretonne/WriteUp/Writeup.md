
# La crypto bretonne

## The problem

We are given the source code:
```py
import os

flag = b"BZHCTF{???????}"

assert len(flag) == 15

key = os.urandom(7)

flag = bytes([f^k for f,k in zip(flag,key)]) + bytes([f^k for f,k in zip(flag[7:],key)])

flag = flag[:7] + bytes([f^k for f,k in zip(flag[:7],flag[7:])])

print("Voici le premier flag d'une longue série :",flag.hex())
```
And the following output:
```
Voici le premier flag d'une longue série : 85de6affbe5e2f20282d373b2808
```

## The solution

So the script creates a random key of length 7, it xor it with the first half of and the flag and the second half, and then xor the first half with the second one. 

The second xor part is cancelling the key so what we are given is:
```
first_half^key + first_half^second half
```
It turns out we know the first half because of the flag format, so we just xor it the the second half, and tada.

Script:
```py
flog = bytes.fromhex("85de6affbe5e2f20282d373b2808")
flag_format = b"BZHCTF{"
print(flag_format+bytes([c^d for c,d in zip(flog[7:],flag_format)])+b"}")
```

Flag : BZHCTF{bretons}

### Shadowwws
