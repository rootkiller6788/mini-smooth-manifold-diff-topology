/- Morphisms - L2 -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def SmoothMap.comp (g f : SmoothMap) : SmoothMap := { domain := f.domain, codomain := g.codomain, maxRank := min f.maxRank g.maxRank }
def SmoothMap.isImmersion (f : SmoothMap) : Bool := f.maxRank == f.domain.dim
def SmoothMap.isSubmersion (f : SmoothMap) : Bool := f.maxRank == f.codomain.dim

#eval "== Morphisms.Hom =="
#eval s!"id_S2 immersion: {(SmoothMap.id (SmoothManifold.sphere 2)).isImmersion}"

end MiniSardMorse