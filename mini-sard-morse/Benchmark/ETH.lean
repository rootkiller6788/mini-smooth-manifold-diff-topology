/- Benchmark: ETH -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def benchmark_eth : List (String × String) := [
  ("401-3462", "Morse on Hilbert manifolds"),
  ("401-3132", "Algebraic topology"),
  ("401-3001", "Differential geometry"),
]

#eval "== Benchmark ETH =="
#eval benchmark_eth

end MiniSardMorse