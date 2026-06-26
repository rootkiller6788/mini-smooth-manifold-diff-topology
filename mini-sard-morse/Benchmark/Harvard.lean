/- Benchmark: Harvard -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def benchmark_harvard : List (String × String) := [
  ("MATH 132", "Topology of manifolds"),
  ("MATH 231", "Differential topology"),
  ("MATH 272", "Symplectic geometry"),
]

#eval "== Benchmark Harvard =="
#eval benchmark_harvard

end MiniSardMorse