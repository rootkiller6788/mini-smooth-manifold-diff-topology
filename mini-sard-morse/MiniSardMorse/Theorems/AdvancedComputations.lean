/- Advanced Computations -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def advancedcomputations_theorems : List (String × String) := [
  ("Exotic spheres", "Theta_7 = Z/28 (Milnor 1956)"),
  ("Kervaire invariant", "1 in dim 2,6,14,30,62 (HHR 2016)"),
  ("Adams SS", "Ext_A(F2,F2) => pi_*^S at prime 2"),
  ("Nilpotence theorem", "Devinatz-Hopkins-Smith 1988"),
  ("Chromatic filtration", "L_0 < L_1 < L_2 < ... < Sp"),
  ("Landweber exact", "MU_*-modules from formal group laws"),
]

#eval "== AdvancedComputations =="
#eval advancedcomputations_theorems

end MiniSardMorse