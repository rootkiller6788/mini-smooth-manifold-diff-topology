/- Benchmark: MIT -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def benchmark_mit : List (String × String) := [
  ("18.901", "Topology of manifolds"),
  ("18.902", "Algebraic topology"),
  ("18.966", "Morse theory and Floer homology"),
]

#eval "== Benchmark MIT =="
#eval benchmark_mit

end MiniSardMorse