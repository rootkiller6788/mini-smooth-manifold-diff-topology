/- Benchmark: Tsinghua -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def benchmark_tsinghua : List (String × String) := [
  ("Diff Top", "Sard theorem"),
  ("Alg Top", "Morse homology"),
  ("Symp Geom", "Floer homology"),
]

#eval "== Benchmark Tsinghua =="
#eval benchmark_tsinghua

end MiniSardMorse