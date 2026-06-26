/- Benchmark: Stanford -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def benchmark_stanford : List (String × String) := [
  ("MATH 215C", "Differential topology"),
  ("MATH 216B", "Algebraic topology"),
  ("MATH 263C", "Symplectic geometry"),
]

#eval "== Benchmark Stanford =="
#eval benchmark_stanford

end MiniSardMorse