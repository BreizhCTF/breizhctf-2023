#!/usr/bin/env python3

import json

import networkx as nx
from pwn import *


def is_oneline_drawable(segments):
    graph = nx.Graph()
    graph.add_edges_from([
        [tuple(s[0]), tuple(s[1])]
        for s in segments
    ])
    return nx.has_eulerian_path(graph)


def solve():
    r = remote('challenge.ctf.bzh', 30022)

    for _ in range(100):
        raw = r.recvuntil('[>] ').decode()
        draw = json.loads(
            raw.split('\n')[-3].split(': ')[1]
        )
        if is_oneline_drawable(draw):
            r.sendline('Oui')
        else:
            r.sendline('Non')

    print(r.recvall().decode())


if __name__ == '__main__':
    solve()
