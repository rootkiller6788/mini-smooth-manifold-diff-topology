/- CW Complex - L3 -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def MorseFunction.toCWComplex (f : MorseFunction) : CWComplex :=
  { cells := [], dimension := f.manifold.dim }

#eval "== CWFromMorse =="
#eval "T2 CW complex"

end MiniSardMorse