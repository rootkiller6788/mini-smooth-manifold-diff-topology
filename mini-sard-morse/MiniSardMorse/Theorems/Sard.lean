/- Sard Theorem - L4 -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def sard_theorem_check (f : SmoothMap) : Bool := Set.measureZero f.criticalValues (f.codomain.dim + 1)

#eval "== Theorems.Sard =="
#eval s!"Sard holds: {sard_theorem_check (SmoothMap.id (SmoothManifold.sphere 2))}"

end MiniSardMorse