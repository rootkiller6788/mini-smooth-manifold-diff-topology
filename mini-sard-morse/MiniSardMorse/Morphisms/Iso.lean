/- Isomorphisms - L2 -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

structure Diffeomorphism where
  source : SmoothManifold
  target : SmoothManifold
  deriving Repr

def Diffeomorphism.id (M : SmoothManifold) : Diffeomorphism := { source := M, target := M }

#eval "== Morphisms.Iso =="
#eval s!"Diffeo S2: {(Diffeomorphism.id (SmoothManifold.sphere 2)).source.dim}"

end MiniSardMorse