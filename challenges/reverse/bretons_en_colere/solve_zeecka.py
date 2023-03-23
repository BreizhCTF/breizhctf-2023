# Based on https://binaryresearch.github.io/2020/01/22/more-angr-defeating-5-ELF-crackmes.html
import angr, claripy
proj = angr.Project("breton", auto_load_libs=False)
key_bytes = [claripy.BVS("byte_%d" % i, 8) for i in range(39)]
key_bytes_AST = claripy.Concat(*key_bytes)
state = proj.factory.entry_state(args=["breton", key_bytes_AST])
sim_mgr = proj.factory.simulation_manager(state)
sim_mgr.explore(find=lambda s: b"flag" in s.posix.dumps(1))
s = sim_mgr.found[0]      # found patterns
flag = s.solver.eval(key_bytes_AST, cast_to = bytes)
print(flag)