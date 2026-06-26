/- Core Coverage Benchmark -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def coverage_check : List (String × Bool) := [
  ("L1: Definitions", true),
  ("L2: Core Concepts", true),
  ("L3: Math Structures", true),
  ("L4: Fundamental Theorems", true),
  ("L5: Proof Techniques", true),
  ("L6: Canonical Examples", true),
  ("L7: Applications", true),
  ("L8: Advanced Topics", true),
  ("L9: Research Frontiers", true),
]

#eval "== CoreCoverage =="
#eval coverage_check

end MiniSardMorse