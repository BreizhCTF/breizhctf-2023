#!/usr/bin/env python3
# -*- coding:utf-8 -*-
from PIL import Image
import random

tarte_1 = Image.open("tarte1.png")
flag = Image.open("flag.png")

assert (tarte_1.size == flag.size)

d1 = list(tarte_1.getdata())
d2 = list(flag.getdata())

d3 = []
for i in range(len(d1)):
    px = d1[i]
    if (d2[i][0] == 255):  # Pixel noir
        px = list(d1[i])
        layer = random.randint(0, 2)
        px[layer] = px[layer]-1 if px[layer] % 2 else px[layer]+1
        px = tuple(px)
    d3.append(px)

assert (d1 != d3)

tarte_2 = Image.new(tarte_1.mode, tarte_1.size)
tarte_2.putdata(d3)
tarte_2.save("tarte2.png")
