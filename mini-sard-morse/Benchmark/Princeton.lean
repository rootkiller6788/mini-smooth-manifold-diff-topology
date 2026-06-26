/- Benchmark: Princeton -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def benchmark_princeton : List (String × String) := [
  ("MAT 520", "Complex analysis + diff top"),
  ("MAT 560", "Morse theory"),
  ("MAT 570", "Algebraic topology"),
]

#eval "== Benchmark Princeton =="
#eval benchmark_princeton

end MiniSardMorse