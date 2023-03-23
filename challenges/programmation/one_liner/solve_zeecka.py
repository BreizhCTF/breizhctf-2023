# https://www.geeksforgeeks.org/eulerian-path-and-circuit/
# Python program to check if a given graph is Eulerian or not
# Complexity : O(V+E)

from pwn import *
from collections import defaultdict

HOST = "challenge.ctf.bzh"
PORT = 30022

# This class represents a undirected graph using adjacency list representation

class Graph:

    def __init__(self, vertices):
        self.V = vertices  # No. of vertices
        self.graph = defaultdict(list)  # default dictionary to store graph

    # function to add an edge to graph
    def addEdge(self, u, v):
        self.graph[u].append(v)
        self.graph[v].append(u)

    # A function used by isConnected
    def DFSUtil(self, v, visited):
        # Mark the current node as visited
        visited[v] = True

        # Recur for all the vertices adjacent to this vertex
        for i in self.graph[v]:
            if visited[i] == False:
                self.DFSUtil(i, visited)

    '''Method to check if all non-zero degree vertices are
    connected. It mainly does DFS traversal starting from
    node with non-zero degree'''

    def isConnected(self):

        # Mark all the vertices as not visited
        visited = [False]*(self.V)

        #  Find a vertex with non-zero degree
        for i in range(self.V):
            if len(self.graph[i]) != 0:
                break

        # If there are no edges in the graph, return true
        if i == self.V-1:
            return True

        # Start DFS traversal from a vertex with non-zero degree
        self.DFSUtil(i, visited)

        # Check if all non-zero degree vertices are visited
        for i in range(self.V):
            if visited[i] == False and len(self.graph[i]) > 0:
                return False

        return True

    '''The function returns one of the following values
        0 --> If graph is not Eulerian
        1 --> If graph has an Euler path (Semi-Eulerian)
        2 --> If graph has an Euler Circuit (Eulerian)  '''

    def isEulerian(self):
        # Check if all non-zero degree vertices are connected
        if self.isConnected() == False:
            return 0
        else:
            # Count vertices with odd degree
            odd = 0
            for i in range(self.V):
                if len(self.graph[i]) % 2 != 0:
                    odd += 1

            '''If odd count is 2, then semi-eulerian.
            If odd count is 0, then eulerian
            If count is more than 2, then graph is not Eulerian
            Note that odd count can never be 1 for undirected graph'''
            if odd == 0:
                return 2  # Euler cycle
            elif odd == 2:
                return 1  # Euler path
            elif odd > 2:
                return 0  # Not Euler

if __name__ == "__main__":
    # Let us create and test graphs shown in above figures

    r = remote(HOST, PORT)
    while True:
        try:
            print(r.recvuntil("Dessin : ").decode())
        except:
            r.interactive()
        data = eval(r.recvuntil("\n"))
        r.recvuntil("[>] ")
        nodes = []
        for draw in data:
            for p in draw:
                nodes.append(f'{p[0]}_{p[1]}')
        nodes = list(set(nodes))
        nodes.sort()

        g1 = Graph(len(nodes))
        for draw in data:
            p1 = draw[0]
            p2 = draw[1]
            i1 = nodes.index(f'{p1[0]}_{p1[1]}')
            i2 = nodes.index(f'{p2[0]}_{p2[1]}')
            g1.addEdge(i1, i2)
        
        if (g1.isEulerian() != 0):
            r.sendline("Oui")
        else:
            r.sendline("Non")