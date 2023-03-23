#!/usr/bin/env python3
# -*- coding:utf-8 -*-
#
# Solution basée sur l'algorithme proposé par Donald Knuth
# https://en.wikipedia.org/wiki/Mastermind_(board_game)#Worst_case:_Five-guess_algorithm

from pwn import *
from itertools import product

HOST = "maintenance.ctf.bzh"
# HOST = "127.0.0.1"
PORT = 30011
r = remote(HOST, PORT)  # Connexion au serveur

def send(c):
    r.sendline((c).encode())

d = r.recvuntil(b"(1,2,3): ").decode("utf-8").replace("\r", '')
print(f"{d}\n")
print("[+] Connected to service")

send("1")  # Register user
d = r.recvuntil(b"nom: ").decode("utf-8").replace("\r", '')
send("aaaaaaa;role=admin;time=167381706100000")  # user name
# Get token
d = r.recvuntil(b"3 minutes.").decode("utf-8").replace("\r", '')
r.recvuntil(b"(1,2,3): ")
token = d.split("votre jeton ")[1].split(".")[0]
print(f"[+] Got token {token}")

# Login with newtoken
new_token = token[:96]
print(f"[+] Logging with {new_token}")
send("2")
r.recvuntil(b"nom: ")
send("a")
r.recvuntil(b"authentification: ")
send(new_token)
d = r.recvuntil(b"}\n").decode("utf-8")
flag = d.split(". ")[1]
print(f"[+] Got flag: {flag}")
