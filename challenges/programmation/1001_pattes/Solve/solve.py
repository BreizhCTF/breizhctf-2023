#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# pylint: disable=invalid-name, line-too-long, consider-using-enumerate

"""
    Langton's Ant program
"""

import sys
import json
from PIL import Image, ImageDraw

sys.setrecursionlimit(15000)


class Ant:
    """ Langton's Ant. """

    def __init__(self, config, position=None):
        self.img = Image.new("RGBA", (WINDOW_WIDTH, WINDOW_HEIGHT))
        self.steps = 0
        self.status = []
        self.config = config
        self.colors = list(self.config.keys())
        self.grid = [[None for i in range(GRID_WIDTH)]
                     for j in range(GRID_HEIGHT)]
        self.position = position
        if position is None:
            self.position = (GRID_WIDTH // 2, GRID_HEIGHT //
                             2)  # Middle of the screen
        self.prev_position = self.position
        self.orientation = "T"
        self.update()

    def update(self):
        """ Move ant and change color. """
        # We need to quit as soon as possible to reduce computing
        # Compute current shape
        current_shape = [[k is not None for k in row] for row in self.grid]
        # Check if current shape is already bigger (if so, quit)
        for row in range(len(SHAPE)):
            for p in range(len(SHAPE[0])):
                if current_shape[row][p] is not None and SHAPE[row][p] is None:
                    return

        # Check if shape is the same
        if current_shape == SHAPE:
            if self.grid == MATRIX:
                print("[+] Found valid solution !")
                print(f"[i] Steps number: {self.steps}")
                print(f"[i] Valid configuration: {self.config}")
                self.save()

        if self.steps < MAX_STEPS:
            self.steps += 1
            x, y = self.position
            if self.grid[y][x] is None:  # White by default
                self.grid[y][x] = "white"
            for i, color in enumerate(self.colors):
                if self.grid[y][x] == color:
                    new_color = self.colors[(i+1) % len(self.colors)]
                    self.grid[y][x] = new_color  # Update color
                    self.move(self.config[new_color])  # Move ant
                    break
            try:
                self.update()
            except IndexError:
                return

    def move(self, turn):
        """ Move ant. Turn can be L or R """
        self.prev_position = self.position
        x, y = self.position
        if self.orientation == "T":
            if turn == "L":
                x, o = x-1, "L"
            else:
                x, o = x+1, "R"
        elif self.orientation == "L":
            if turn == "L":
                y, o = y+1, "B"
            else:
                y, o = y-1, "T"
        elif self.orientation == "B":
            if turn == "L":
                x, o = x+1, "R"
            else:
                x, o = x-1, "L"
        else:  # R
            if turn == "L":
                y, o = y-1, "T"
            else:
                y, o = y+1, "B"

        self.position = (x, y)
        self.orientation = o

    def save(self):
        """ Save ant drawing as image. """
        # Draw squares
        img = ImageDraw.Draw(self.img)
        for y in range(GRID_HEIGHT):
            for x in range(GRID_WIDTH):
                color = self.grid[y][x]
                if color is None:
                    continue
                img.rectangle([
                    (x * CELL_SIZE, y * CELL_SIZE),
                    (x * CELL_SIZE + CELL_SIZE + CELL_BORDER - 1, y * CELL_SIZE + CELL_SIZE + CELL_BORDER - 1)],
                    outline="black", fill=color, width=CELL_BORDER
                )
        # Draw ant
        x, y = self.prev_position
        ant_size = ANT_SIZE - 1
        padding = (CELL_SIZE + CELL_BORDER - ant_size)//2
        img.ellipse([
            (x * CELL_SIZE + padding, y * CELL_SIZE + padding),
            (x * CELL_SIZE + ant_size + padding, y * CELL_SIZE + ant_size + padding)],
            fill="black"
        )
        filename = f"imgs/challenge_{self.steps}_{''.join(self.config.values())}.png"
        self.img.save(filename)

def get_challenge(filename):
    """ Return shape and matrix for a given ant art. """
    challenge = Image.open(filename)
    rgba_matrix_1d = []
    for my in range(CELL_BORDER + 1, WINDOW_HEIGHT, CELL_SIZE):
        for mx in range(CELL_BORDER + 1, WINDOW_WIDTH, CELL_SIZE):
            rgba_matrix_1d.append(challenge.getpixel((mx, my)))
    colors_map = {
        (95, 158, 160, 255): "cadetblue",
        (127, 255, 0, 255): "chartreuse",
        (255, 105, 180, 255): "hotpink",
        (255, 0, 0, 255): "red",
        (46, 139, 87, 255): "seagreen",
        (255, 255, 255, 255): "white",
        (0, 0, 0, 0): None,
        (255, 255, 0, 255): "yellow"
    }
    rgba_matrix = []
    for i in range(0, len(rgba_matrix_1d), GRID_WIDTH):
        rgba_matrix.append(rgba_matrix_1d[i: i+GRID_WIDTH])

    matrix = [[colors_map[k] for k in row] for row in rgba_matrix]
    shape = [[k is not None for k in row] for row in matrix]

    return shape, matrix

if __name__ == "__main__":
    # Load partial config with known variables such as sizes and colors number
    with open('partial_config.json', encoding='utf-8') as json_file:
        data = json.load(json_file)
        CONFIG = data["colors"]
        MAX_STEPS = data["steps"]
        SIZES = data["sizes"]
        CELL_INSIDE = SIZES["cell"]
        CELL_BORDER = SIZES["border"]
        GRID_WIDTH = SIZES["grid"]

    CELL_SIZE = CELL_INSIDE + CELL_BORDER
    ANT_SIZE = CELL_INSIDE - 2
    GRID_HEIGHT = GRID_WIDTH  # Square image
    WINDOW_WIDTH = CELL_SIZE * GRID_WIDTH + CELL_BORDER
    WINDOW_HEIGHT = CELL_SIZE * GRID_HEIGHT + CELL_BORDER

    # Convert image to matrix of colors & shape
    SHAPE, MATRIX = get_challenge("challenge.png")

    # Test each combination of L/R up to `MAX_STEPS` steps.
    N = 2**len(CONFIG)
    for j in range(N):
        print(f"{j}/{N}")
        bin_j = bin(j)[2:].zfill(len(CONFIG))  # binary notation tricks
        conf = bin_j.replace("0", "L").replace("1", "R")
        CONFIG = {
            "cadetblue": conf[0],
            "chartreuse": conf[1],
            "hotpink": conf[2],
            "red": conf[3],
            "seagreen": conf[4],
            "white": conf[5],
            "yellow": conf[6]
        }

        # Start drawing
        try:
            Ant(CONFIG)
        except Exception() as e:
            print(e)
            continue
