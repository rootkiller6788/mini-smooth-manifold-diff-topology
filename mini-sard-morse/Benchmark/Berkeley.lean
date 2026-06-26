/- Benchmark: Berkeley -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def benchmark_berkeley : List (String × String) := [
  ("MATH 214", "Differentiable manifolds"),
  ("MATH 215A", "Algebraic topology"),
  ("MATH 255", "Morse theory"),
]

#eval "== Benchmark Berkeley =="
#eval benchmark_berkeley

end MiniSardMorse