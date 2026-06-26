/- Invariants - L5 -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def euler_inv (M : SmoothManifold) : Bool := M.eulerChar == M.eulerChar

#eval "== Invariants =="
#eval s!"Euler invariant holds: {euler_inv (SmoothManifold.sphere 2)}"

end MiniSardMorse