#!/usr/bin/env python3
# -*- coding:utf-8 -*-

"""
    Install and update challenge.yml using ctfcli

    - Sort by Category name, Difficuty and Challenge name
    - Default "Categorie" is removed
    - "Autres" category is set at the top
    - Unknown difficulties are added first
"""

import glob, os, subprocess, sys, traceback

# Get each challenge.yml
chall_list = []
for root, dirs, files in os.walk("challenges"):
    for file in files:
        if file.endswith('challenge.yml'):
            chall_list.append(f"{root}/{file}")

# For each file, extract category, name and difficulty
# chall_dict[category][difficulty][name]
chall_dict = {}
for f in chall_list:
    content = open(f, 'r').readlines()
    difficulty = '?'
    category = '?'
    name = '?'
    for l in content:
        if l.startswith("category: "):
            category = l.strip("category: ").strip()
        elif l.startswith("name: "):
            name = l.strip("name: ").strip().strip('"')
        elif "facile" in l.lower() or \
             "moyen" in l.lower() or \
             "difficile" in l.lower():
            difficulty = l.strip().strip('-').strip()

    if category not in chall_dict:
        chall_dict[category] = {}
    if difficulty not in chall_dict[category]:
        chall_dict[category][difficulty] = {}
    
    chall_dict[category][difficulty][name] = f

# Sort challenges by Category
category_order = list(chall_dict.keys())
category_order.sort()
category_order.remove("Autres")
category_order.remove("Categorie")
category_order = ["Autres"] + category_order

# Then by difficulty
difficulty_order = ["?", "Très Facile", "Facile", "Moyen", "Difficile", "Très Difficile"]

yakuza = []  # Serie de chall
crepes = []  # Serie de chall

# Add challenges
for c in category_order:
    for d in difficulty_order:
        if d not in chall_dict[c]:
            continue
        chall_names = list(chall_dict[c][d].keys())  # Sort by names
        chall_names.sort()
        for n in chall_names:
            if "Yakuza" in n:
                yakuza.append(chall_dict[c][d][n])
                continue
            if "BreizhCrêpes" in n:
                crepes.append(chall_dict[c][d][n])
                continue

            print(f"[+] {n}")
            path = chall_dict[c][d][n]
            try:
                output = subprocess.check_output(["python3", "-m", "ctfcli", "challenge", "install", path], stderr=subprocess.STDOUT).decode()
                if "Already found existing challenge" in output:
                    output = subprocess.check_output(["python3", "-m", "ctfcli", "challenge", "sync", path], stderr=subprocess.STDOUT).decode()
                print(output)
            except subprocess.CalledProcessError as exc:
                print(f"[!!!] Error with challenge {path}")
                print("Status : FAIL", exc.returncode, exc.output)
            except Exception as e:
                print(f"[!!!] Error with challenge {path}")
                print(e)
                print(traceback.format_exc())
                print(sys.exc_info()[2])

yakuza.sort()
crepes.sort()

for path in yakuza+crepes:
    try:
        output = subprocess.check_output(["python3", "-m", "ctfcli", "challenge", "install", path], stderr=subprocess.STDOUT).decode()
        if "Already found existing challenge" in output:
            output = subprocess.check_output(["python3", "-m", "ctfcli", "challenge", "sync", path], stderr=subprocess.STDOUT).decode()
        # print(output)
    except subprocess.CalledProcessError as exc:
        print(f"[!!!] Error with challenge {path}")
        print("Status : FAIL", exc.returncode, exc.output)
    except Exception as e:
        print(f"[!!!] Error with challenge {path}")
        print(e)
        print(traceback.format_exc())
        print(sys.exc_info()[2])
