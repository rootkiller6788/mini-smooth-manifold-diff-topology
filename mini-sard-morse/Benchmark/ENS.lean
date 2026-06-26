/- Benchmark: ENS -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def benchmark_ens : List (String × String) := [
  ("Geom Diff", "Reeb, Morse inequalities"),
  ("Top Alg", "Handle decompositions"),
]

#eval "== Benchmark ENS =="
#eval benchmark_ens

end MiniSardMorse