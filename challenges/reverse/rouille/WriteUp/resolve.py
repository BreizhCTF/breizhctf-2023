from z3 import *

solver = Solver()

flag  = [BitVec(f"flag[{i}]", 8) for i in range(25)]

solver.add((flag[0]) == ord('B'))
solver.add((flag[1]) == ord('Z'))
solver.add((flag[2]) == ord('H'))
solver.add((flag[3]) == ord('C'))
solver.add((flag[4]) == ord('T'))
solver.add((flag[5]) == ord('F'))
solver.add((flag[6]) == ord('{'))
solver.add((flag[24] == ord('}')))
solver.add((flag[7]) == 48)
solver.add((flag[8] ^ 0x45) == 48)
solver.add((flag[9] ^ 0x44) == 48)
solver.add((flag[10] ^ 0x6F) == 48)
solver.add((flag[11]) == 48)
solver.add((flag[12] ^ 0x56) == 48)
solver.add((flag[13] ^ 0x6F) == 48)
solver.add((flag[14] ^ 0x7) == 48)
solver.add((flag[15] ^ 0x58) == 48)
solver.add((flag[16] ^ 0x3) == 48)
solver.add((flag[17] ^ 0x6F) == 48)
solver.add((flag[18] ^ 0x5D) == 48)
solver.add((flag[19] ^ 0x4) == 48)
solver.add((flag[20] ^ 0x6A) == 48)
solver.add((flag[21] ^ 0x55) == 48)
solver.add((flag[22] ^ 0x6F) == 48)
solver.add((flag[23] ^ 0x11) == 48)
solver.add((flag[24] ^ 0x4D) == 48)

print(solver.check())

while solver.check() == z3.sat:
    if solver.check() == sat:
        model = solver.model()
        flag_str = ''.join([chr(model[flag[i]].as_long()) for i in range(25)])
        print(flag_str)
    else:
        print("Unable to find a solution.")

    break
