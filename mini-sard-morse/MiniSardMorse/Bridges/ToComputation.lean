/- Computational Applications -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def comp_apps : List (String × String) := [
  ("Persistent homology", "Topological data analysis"),
  ("Discrete Morse", "Morse for simplicial complexes"),
  ("Reeb graphs", "Level set topology data structure"),
  ("MS complex", "Combinatorial gradient field"),
  ("Topological simplification", "Morse cancellation"),
]

#eval "== ToComputation =="
#eval comp_apps

end MiniSardMorse