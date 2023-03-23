import angr
import claripy
import subprocess
import sys

num_keys = 5

proj = angr.Project("./breton",  auto_load_libs=False)

goodboy = 0x4015d8

key_bytes = [claripy.BVS("byte_%d" % i, 8) for i in range(39)]
key_bytes_AST = claripy.Concat(*key_bytes)

initial_state = proj.factory.entry_state(args=["breton", key_bytes_AST])

for byte in key_bytes:
        initial_state.solver.add(byte >= 0x21, byte <= 0x7e)

simulation = proj.factory.simulation_manager(initial_state)

simulation.explore(find=goodboy)

if simulation.found:
    keys = simulation.found[0].solver.eval_upto(key_bytes_AST, num_keys, cast_to = bytes)
    for key in keys:
            output = subprocess.run(["./bin", key], stdout = subprocess.PIPE)
            print("[ + ]  %s\t%s" % (key.decode("ascii"), repr(output.stdout)))
    else:
        print("[ x ] No solution found")

else:
    print("No solution")
