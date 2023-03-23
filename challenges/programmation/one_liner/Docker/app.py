#!/usr/bin/env python3

import sys
import signal
import random

from colorama import Fore, Style

from model import Draw, Session


session = Session()

FLAG = 'BZHCTF{000_Le0nhard_Eul3r_111}'
DATASET_SIZE = session.query(Draw).count()
NUMBER_OF_ROUND = 100
TIMEOUT = 60


def print_banner():
    print(f'''{Fore.YELLOW}
     ____           ◉   __   _             
  ◉ / __ \___◌ ___ ____/ /  (_)__◉ ___ ____  ◌
   / /_/ / _ \/ -_)___/ /__/ / _ \/ -_) __/
 ◌ \____/_//_/\__/   /____/_/_//_/\__/_/ ◉ 
    {Style.RESET_ALL}\n''')


def print_flag():
    print(f'\n{Fore.GREEN}[v] Bien joué !{Style.RESET_ALL}')
    print(f'{Fore.GREEN}[v] Flag : {FLAG}{Style.RESET_ALL}')


def print_info(message):
    print(f'{Fore.BLUE}[i]{Style.RESET_ALL} {message}')


def print_error(message):
    print(f'{Fore.RED}[x]{Style.RESET_ALL} {message}')


def print_question(message):
    print(f'{Fore.YELLOW}[?]{Style.RESET_ALL} {message}')


def run_challenge():
    print_banner()
    for i in range(1, NUMBER_OF_ROUND + 1):
        try:
            run_round(i)
        except Exception as e:
            print_error(e)
            sys.exit(1)
    print_flag()


def run_round(num):
    random_index = random.randint(0, DATASET_SIZE - 1)
    random_row = session.query(Draw).offset(random_index).limit(1).one()

    print(f'{Style.DIM}[ {"―" * 40} ]{Style.RESET_ALL}\n')
    print_info(f'Round {num:03d}/{NUMBER_OF_ROUND}')
    print_info(f'Dessin : {random_row.drawing}')
    print_question('Dessinable sans lever le crayon ? (Oui/Non)')

    resp = input(f'{Fore.YELLOW}[>] ')
    print(Style.RESET_ALL)
    if not (
        (random_row.oneline_drawable and resp == 'Oui')
        or (not random_row.oneline_drawable and resp == 'Non')
    ):
        raise Exception('Mauvaise réponse !')


def timeout_handler(signum, frame):
    print('\n')
    print_error(f'Vous devez être plus rapide ! (timeout {TIMEOUT}s)')
    sys.exit(1)


if __name__ == '__main__':
    # Install timeout signal
    signal.signal(signal.SIGALRM, timeout_handler)
    signal.alarm(TIMEOUT)
    # Run the challenge
    run_challenge()
