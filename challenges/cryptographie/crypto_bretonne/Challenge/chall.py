import os

flag = b"BZHCTF{???????}"

assert len(flag) == 15

key = os.urandom(7)

flag = bytes([f^k for f,k in zip(flag,key)]) + bytes([f^k for f,k in zip(flag[7:],key)])

flag = flag[:7] + bytes([f^k for f,k in zip(flag[:7],flag[7:])])

print("Voici le premier flag d'une longue série :",flag.hex())
