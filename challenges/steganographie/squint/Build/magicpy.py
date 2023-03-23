#!/usr/bin/python

# Copyright (C) 2012 Michael Hansen (mihansen@indiana.edu)

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import numpy, argparse
from PIL import ImageFont, ImageDraw, Image

def gen_pattern(width, height):
    return numpy.random.randint(0, 256, (width, height))


def create_image_text(size, bgColor, message, font, fontColor):
    W, H = size
    image = Image.new('RGB', size, bgColor)
    draw = ImageDraw.Draw(image)
    _, _, w, h = draw.textbbox((0, 0), message, font=font)
    draw.text(((W-w)/2, (H-h)/2), message, font=font, fill=fontColor)
    return image


if __name__ == '__main__':

    parser = argparse.ArgumentParser(description = "Autostereogram (MagicEye) generator")
    parser.add_argument("flag", type=str, help = "Flag text")

    parser.add_argument("-o", "--output", type=str, default="output.png",
            help="Path to write output image")

    parser.add_argument("-p", "--pattern-div", type=int, default=8,
            help = "Width of generated pattern (width n means 1/n of depth-map width)")

    parser.add_argument("-i", "--invert", action="store_true", help = "Invert depthmap (white = far)")

    args = parser.parse_args()
    invert = -1 if args.invert else 1

    myFont = ImageFont.truetype('ariblk.ttf', int(800/len(args.flag)))
    imageopen = create_image_text((800, 1143), 'black', args.flag, myFont, 'white')

    depth_data = imageopen.load()

    out_img = Image.new("L", imageopen.size)
    out_data = out_img.load()

    pattern_width = imageopen.size[0] / args.pattern_div
    pattern = gen_pattern(int(pattern_width), imageopen.size[1])

    # Create stereogram
    for x in range(0, imageopen.size[0]):
        for y in range(0, imageopen.size[1]):
            if x < pattern_width:
                out_data[x, y] = int(pattern[x, y])  # Use generated pattern
            else:
                shift = depth_data[x, y][0] / args.pattern_div  # 255 is closest
                out_data[x, y] = out_data[x - pattern_width + (shift * invert), y]

    out_img.save(args.output)
