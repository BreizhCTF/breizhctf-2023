#!/usr/bin/env python3

import time
from binascii import hexlify, unhexlify
from flag import flag
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad


token_lifetime = 3  # 3 min

welcome = """Bonjour et bienvenue sur l'interface CLI du BreizhCTF !"""

menu = """
---------------------------------------
1. Demander un jeton d'authentification
2. S'authentifier
3. Quitter
---------------------------------------

Entrez votre choix (1,2,3): """

msg_register = """La fonctionnalité d'enregistrement vous permet de récupérer un compte invité.
Renseigner votre nom: """

msg_register_ok = f"""Vous pouvez à présent vous authentifier à l'aide de votre jeton {{0}}.
Celui-ci est valide pour une durée de {token_lifetime} minutes.

En cas d'erreur, transmettez ce code à votre administrateur: {{1}}."""

msg_auth_name = "Veuillez renseigner votre nom: "
msg_auth_token = "Veuillez renseigner votre jeton d'authentification: "

msg_logged_admin =  f"Vous être a présent connecté en tant qu'administrateur. {flag}"
msg_logged_user = "Vous être a présent connecté en tant qu'invité. Le serveur est actuellement en maintenance, seuls les administrateurs sont autorisés à se connecter."
msg_logged_error = "Erreur, jeton d'authentification incorrecte."

print(welcome)

# os.urandom(16)
cipher = AES.new(b'\xc5\x1c\x97\x91\x83\t3\xdc\x98\x17\x7fgt\xb4\xbai', AES.MODE_ECB)


choice_quit = False
while not choice_quit:
    choice = input(menu)
    if choice == "1":
        # Compute token (role=invite)
        name = input(msg_register)
        t = int(time.time())
        token = f"username={name};role=invite;time={t}"
        ciphered_token = hexlify(cipher.encrypt(pad(token.encode(), 16))).decode()

        print(msg_register_ok.format(ciphered_token, hexlify(token.encode()).decode()))
    elif choice == "2":
        auth_name = input(msg_auth_name)
        auth_token = input(msg_auth_token)
        try:
            token = cipher.decrypt(unhexlify(auth_token)).decode().lower()
            logged_admin = True
            logged_user = True
            if ((token.count("username=") != 1) or \
                (token.count("role=") != 1) or \
                (token.count("time=") != 1)):
                logged_admin = False
                logged_user = False
            if token.count("role=admin") != 1:
                logged_admin = False
            if token.count("role=invite") != 1:
                logged_user = False
            
            # Expiration
            t1 = int(time.time())
            t2 = int(token.split("time=")[1])
            if (t1 - t2) > (token_lifetime * 60):
                logged_admin = False
                logged_user = False
            
            if logged_admin:
                print(msg_logged_admin)
            elif logged_user:
                print(msg_logged_user)
            else:
                print(msg_logged_error)
        except Exception as e:
            print(e)
            print(msg_logged_error)    
    elif choice == "3":
        choice_quit = True