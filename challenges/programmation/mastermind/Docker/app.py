#!/usr/bin/env python3

import secrets
from termcolor import colored
from _thread import start_new_thread
from flag import FLAG
import sys

colors = {
    'Y': colored('● ', 'yellow'),
    'B': colored('● ', 'blue'),
    'R': colored('● ', 'red'),
    'G': colored('● ', 'green'),
    'W': colored('● ', 'white'),
    'P': colored('● ', 'magenta')
}

RULES = f"""{(colors['Y']+colors['B']+colors['R']+colors['G']+colors['W']+colors['P'])*6}
            .
            |\ .                {colored('Hello World!', 'blue')}
          . | \|\               {colored('Saviez-vous que le jeu du Mastermind', 'magenta')}
     _____|\|  \ \_             {colored('est NP-complet ?', 'magenta')}
      '-._   ,-'-. '.______     {colored('Resolvez les parties suivantes pour', 'green')}
         / //_   _\  _.-;'      {colored('remporter le flag.', 'green')}
        /,'/ o : o | .-'
       /':'|\  _  /,'           {colored('Les couleurs disponibles sont', 'white')}
         _\|_'._.'___           {colored('Y','yellow')},{colored('B','blue')},{colored('R','red')},{colored('G','green')},{colored('W','white')},{colored('P','magenta')}
        /             \         {colored('Exemple de réponse : ', 'white')}{colored('R','red')},{colored('G','green')},{colored('P','magenta')},{colored('R','red')}

{(colors['Y']+colors['B']+colors['R']+colors['G']+colors['W']+colors['P'])*6}

"""


def get_board(coups):
    """ Return Graphic Mastermind Board. """
    l1, l2, l3, l4 = "", "", "", ""
    for c in coups:
        l1 += colors[c[0]]
        l2 += colors[c[1]]
        l3 += colors[c[2]]
        l4 += colors[c[3]]
    n = 13 - (len(coups)*2)
    out = "-"*16+"\n"
    out += "| "+l1+" "*n+"|\n"
    out += "| "+l2+" "*n+"|\n"
    out += "| "+l3+" "*n+"|\n"
    out += "| "+l4+" "*n+"|\n"
    out += "-"*16
    return out


def client_handler():
    score = 0
    n = 100 # Nombre de parties pour flag
    couleurs = ['Y', 'B', 'R', 'G', 'W', 'P']
    while score < n:
        # Début d'une partie
        coups = []
        secret = [secrets.choice(couleurs) for i in range(4)]
        essais = 0
        found = False
        print(RULES)
        head = f"--- Nouvelle partie ({score+1}/{n}) ! ---"
        print(head)
        while essais < 7:
            print(">>>", end = '')
            data = input().strip()
            data = data.split(',')

            # Gestion des exceptions
            if len(data) != 4:
                print("[!] Perdu (format incorrect)!")
                sys.exit(0)

            for elt in data:
                if elt not in couleurs:
                    print("[!] Perdu (couleur inconnue)!")
                    sys.exit(0)

            coups.append(data)

            # Calcul des points
            nb_correct = 0
            nb_wrongplace = 0
            data_2 = []
            secret_2 = []
            for i in range(4):
                if secret[i] == data[i]:
                    nb_correct += 1
                else:
                    data_2.append(data[i])
                    secret_2.append(secret[i])
            for p in data_2:
                if p in secret_2:
                    nb_wrongplace += 1
                    del secret_2[secret_2.index(p)]

            # Afficher la board
            print(get_board(coups))

            if nb_correct == 4:
                found = True
                break
            else:
                status = f"[?] Corrects: {nb_correct} ; "
                status += f"Mal placés: {nb_wrongplace}"
                print(status)
                essais += 1

        if found is False:
            print("[!] Perdu !")
            sys.exit(0)
            break
        else:
            score += 1
            reply = f"[+] Gagné ({score}/{n})"
            print(reply)
    print((f"[+] Bravo !\nLe Flag est {FLAG}"))
    sys.exit(0)

client_handler()