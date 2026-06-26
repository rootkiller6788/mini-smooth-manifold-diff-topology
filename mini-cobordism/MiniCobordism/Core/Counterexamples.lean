import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def counterexampleList : List String := [
  "RP^2 is NOT a boundary (w_1^2[RP^2] = 1 != 0 mod 2)",
  "CP^2 is NOT an oriented boundary (signature = 1 != 0)",
  "S^7 has 28 distinct smooth structures (Milnor 1956)",
  "The Wu manifold SU(3)/SO(3) has order 2 in O_5^SO",
  "CP^2 # CP^2 is not an almost-complex manifold",
  "The forgetful map O_*^U -> O_*^SO is not surjective",
  "Exotic R^4 exists (Donaldson 1983)",
  "h-cobordism theorem fails in DIFF category in dimension 4",
  "Lens spaces L(7,1) and L(7,2) are homotopy equivalent but not diffeomorphic",
  "Kervaire invariant 1 element exists only up to dim 62 (HHR 2016)"
]

#eval "== Counterexamples =="
#eval counterexampleList


end MiniCobordism
