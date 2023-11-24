import angr
import claripy
import logging

logging.getLogger("angr.sim_manager").setLevel(logging.DEBUG)
proj = angr.Project("./super_angry", auto_load_libs=False)
sym_argv = claripy.BVS(" sym_argv", 8 * 32)
state = proj.factory.entry_state(args=[proj.filename, sym_argv])
simgr = proj.factory.simulation_manager(state)
simgr.explore(find=lambda s: b"Correct!" in s.posix.dumps(1))
if len(simgr.found):
    print(simgr.found[0].solver.eval(sym_argv, cast_to=bytes))
else:
    print("Not found")
