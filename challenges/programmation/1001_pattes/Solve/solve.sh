#!/bin/sh
echo "Run solve.py to generate imgs/<solution>.png"
echo "Then, adapt variables in solution.json according to solve.py output"
echo ""
echo "BZHCTF{$(md5sum solution.json | awk '{print $1}')}"