/- Benchmark: Oxford -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def benchmark_oxford : List (String × String) := [
  ("C3.2", "Geometric topology"),
  ("C3.1", "Algebraic topology"),
  ("C2.2", "Homological algebra"),
]

#eval "== Benchmark Oxford =="
#eval benchmark_oxford

end MiniSardMorse