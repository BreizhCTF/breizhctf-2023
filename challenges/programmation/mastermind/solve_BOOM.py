#!/usr/bin/env python3

from itertools import product
from pwn import *

BOARD_SIZE = 4
COLORS = ['Y', 'B', 'R', 'G', 'W', 'P']


def generate_set(colors, board_size):
    return list(product(colors, repeat=board_size))


def get_move_result(data, secret):
    corrects = 0
    misplaced = 0
    data_2 = []
    secret_2 = []
    for i in range(4):
        if secret[i] == data[i]:
            corrects += 1
        else:
            data_2.append(data[i])
            secret_2.append(secret[i])
    for p in data_2:
        if p in secret_2:
            misplaced += 1
            del secret_2[secret_2.index(p)]
    return f'{corrects}{misplaced}'


def reduce_set(set_, guess, result):
    # print('-' * 40)
    new_set = []
    for move in set_:
        if get_move_result(guess, move) == result:
            new_set.append(move)
    return new_set


def get_move(set_):
    # Possible results
    results = set()
    for i in range(5):
        for j in range(5-i):
            results.add(f'{i}{j}')
            results.add(f'{j}{i}')
    results = list(results)
    # Find a move
    moves = []
    for move in set_:
        min_score = 200000
        for result in results:
            score = len(reduce_set(set_, move, result))
            if score < min_score:
                min_score = score
        moves.append((min_score, move))
    return sorted(moves)[-1][1]


r = remote('mastermind.breizh.ctf', 1337, level='debug')
r.recvuntil(b'>>>')

for _ in range(100):
    set_ = generate_set(COLORS, BOARD_SIZE)

    for i in range(7):
        if i == 0:
            move = ['Y', 'Y', 'B', 'B']
        else:
            move = get_move(set_)
        r.sendline(bytes(','.join(move), 'utf-8'))
        resp = r.recvuntil(b'>>>').decode()
        if 'Gagné' in resp:
            break
        else:
            corrects = resp[-21]
            misplaced = resp[-5]
            set_ = reduce_set(set_, move, f'{corrects}{misplaced}')

print(r.recvall())
