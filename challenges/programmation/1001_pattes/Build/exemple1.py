#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# pylint: disable=invalid-name, line-too-long

"""
    Langton's Ant program
"""

import sys
import json
from PIL import Image, ImageDraw

sys.setrecursionlimit(10000)


class Ant:
    """ Langton's Ant. """

    def __init__(self, config, position=None):
        self.img = Image.new("RGBA", (WINDOW_WIDTH, WINDOW_HEIGHT))
        self.steps = 0
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
                self.save()
        else:
            self.save()

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
        filename = "exemple1.png"
        self.img.save(filename)


if __name__ == "__main__":
    # Load config
    with open('config1.json', encoding='utf-8') as json_file:
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

    Ant(CONFIG)
