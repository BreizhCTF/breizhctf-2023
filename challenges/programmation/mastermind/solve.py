#!/usr/bin/env python3
# -*- coding:utf-8 -*-
#
# Solution basée sur l'algorithme proposé par Donald Knuth
# https://en.wikipedia.org/wiki/Mastermind_(board_game)#Worst_case:_Five-guess_algorithm

from pwn import *
from itertools import product
import base64

HOST = "mastermind.breizh.ctf"
PORT = 1337
r = remote(HOST, PORT)  # Connexion au serveur
colors = ['Y', 'B', 'R', 'G', 'W', 'P']


def send(c):
    r.sendline((c).encode())


def reponse(essai):
    """ Requète le serveur en jouant un coup. """
    send(','.join(essai))
    print(f">>>{','.join(essai)}")
    try:
        data = r.recvuntil(b">>>").decode()
    except:  # Got the flag
        r.interactive()
    board = '\n'.join(data.split('-\n')[0:2]).strip()
    print(board)
    score = data.split('-\n')[2].strip()
    if "[+]" in score:
        print(score)
        return (4, 0)
    correct = int(score.split(" ")[2][0])
    mal_place = int(score.split(" ")[6][0])
    print(f"Correctes = {correct}, Mal placés = {mal_place}")
    return (correct, mal_place)


def partie():
    """ Déroulement d'une partie. """
    gagne = False
    essai = "YYBB"  # Notre premier coup est 1122

    # Creation des 1296 possibilités
    possible = [''.join(p) for p in product('YBRGWP', repeat=4)]
    candidats = [''.join(p) for p in product('YBRGWP', repeat=4)]
    while not gagne:
        # On retire notre essai
        possible.remove(essai)
        if essai in candidats:
            candidats.remove(essai)
        # On joue notre essai pour récupéré les Corrects / Mal placés
        rep_code = reponse(essai)

        if rep_code[0] == 4:
            gagne = True
            break

        # Maj des candidats
        candidats = maj_candidats(candidats, essai, rep_code)
        # Calcul le prochain coup
        essai = minimax(possible, candidats)


def calculer_reponse(data, secret):
    """ Calcule la réponse que pourrait renvoyer le serveur
    pour un code et un secret donné. """
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
    return (nb_correct, nb_wrongplace)


def maj_candidats(candidats, essai, rep_code):
    """ Mise à jours des candidats potentiels.

    Pour chaque candidat, on compare notre essai avec le candidat,
    comme si celui-ci était le code secret.
    Si la réponse est différente, alors le candidat est élimité,
    car la réponse attendue ne correspond pas à la réponse recue.
    A l'inverse si le réponses coincident, alors on garde le candidat.

    """
    nouveau_candidats = []
    for c in candidats:
        if calculer_reponse(essai, c) == rep_code:
            nouveau_candidats.append(c)
    return nouveau_candidats

def minimax(possible, candidats):
    """ 
    On parcours l'ensemble des coups jouables et on regarde
    le nombre maximum de possibilités retirées pour chaque coup
    et chaque réponse possible du serveur (0, 1), (1, 1)...
    Parmis ces réponses possibles, on retiendra la réponse la moins
    avantageuse (avec le nombre de candidats éliminés le plus bas).
    Enfin parmis les candidats minimum éliminés pour chaque coup,
    on choisi le coup le plus avantageux.

    https://fr.wikipedia.org/wiki/Algorithme_minimax
    """
    couts = {}
    rp = [  # Réponses possibles du serveur
        (0, 0), (0, 1), (0, 2), (0, 3), (0, 4),
        (1, 0), (1, 1), (1, 2), (1, 3),
        (2, 0), (2, 1), (2, 2),
        (3, 0), (3, 1), (4, 0)]
    for p in possible:  # Pour chaque coup jouable
        couts[p] = []
        for r in rp:  # On calcule pour chaque réponse du serveur...
            total = 0
            for c in candidats:  # ...si un candidat peut être enlevé
                if calculer_reponse(p, c) != r:  # 
                    total += 1
            couts[p].append(total)  # On enregistre le nombre de candidat
        couts[p] = min(couts[p])  # On garde la réponse la moins avantageuse
    max_cout = max(couts.values())
    # On recup la liste des coups les plus avantageux
    coups_max = [k for k,v in couts.items() if v == max_cout]
    # On retourne le coup le plus avantageux (candidat en priorité)
    for c in coups_max:
        if c in candidats:
            return c
    return c


if __name__ == "__main__":
    intro = r.recvuntil(b">>>").decode().strip(">>>")
    print(intro)
    while True:
        partie()