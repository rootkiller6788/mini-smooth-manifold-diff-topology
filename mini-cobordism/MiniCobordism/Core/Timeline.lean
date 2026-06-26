import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def timeline : List (Nat × String) := [
  (1954, "Thom: Cobordism theory founded; unoriented classification"),
  (1954, "Hirzebruch: Signature theorem"),
  (1956, "Milnor: Exotic 7-spheres"),
  (1960, "Wall: Oriented cobordism classification"),
  (1960, "Milnor-Novikov: Complex cobordism ring MU_*"),
  (1961, "Smale: h-cobordism theorem; Poincare conjecture dim>=5"),
  (1963, "Kervaire-Milnor: Homotopy spheres"),
  (1965, "Barden-Mazur-Stallings: s-cobordism theorem"),
  (1969, "Quillen: MU_* classifies formal group laws"),
  (1970, "Sullivan: Surgery exact sequence"),
  (1976, "Landweber: Exact functor theorem"),
  (1982, "Freedman: TOP 4-dim Poincare conjecture"),
  (1983, "Donaldson: Exotic R^4"),
  (1988, "Devinatz-Hopkins-Smith: Nilpotence theorem"),
  (1994, "Seiberg-Witten: Monopole equations"),
  (1998, "Hopkins-Smith: Periodicity theorem"),
  (2005, "Hopkins-Mahowald: String cobordism and TMF"),
  (2009, "Lurie: Cobordism hypothesis"),
  (2016, "Hill-Hopkins-Ravenel: Kervaire invariant 1 resolved")
]

def timelineDetail : List (Nat × String × String) := [
  (1954, "Thom", "Commentarii Math Helv 28: Quelques proprietes..."),
  (1956, "Milnor", "Annals of Math 64: On manifolds homeomorphic to the 7-sphere"),
  (1961, "Smale", "Annals of Math 74: Generalized Poincare conjecture"),
  (1963, "Kervaire-Milnor", "Annals of Math 77: Groups of homotopy spheres"),
  (1969, "Quillen", "Annals of Math 90: Formal group laws"),
  (1988, "D-H-S", "Annals of Math 128: Nilpotence I"),
  (2016, "H-H-R", "Annals of Math 184: Kervaire invariant 1")
]

#eval "== Timeline =="
#eval timeline
#eval timelineDetail


end MiniCobordism
