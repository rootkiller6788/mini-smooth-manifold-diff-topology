/- Benchmark: Cambridge -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def benchmark_cambridge : List (String × String) := [
  ("Part III Diff Geom", "Morse theory on loop spaces"),
  ("Part III Alg Top", "Cobordism and surgery"),
]

#eval "== Benchmark Cambridge =="
#eval benchmark_cambridge

end MiniSardMorse