/- Classification Theorems -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def classification_theorems : List (String × String) := [
  ("Thom (1954)", "N_* = F2[x_n | n != 2^i-1]"),
  ("Wall (1960)", "Oriented cobordism ring structure"),
  ("Milnor-Novikov", "MU_* = Z[a1,a2,...]"),
  ("Pontryagin-Thom", "Omega_n = pi_{n+k}(MO(k))"),
  ("Smale (1961)", "h-cobordism theorem for dim>=5"),
  ("Freedman (1982)", "Topological h-cobordism in dim 4"),
  ("Donaldson (1983)", "Smooth h-cobordism fails in dim 4"),
]

#eval "== Classification =="
#eval classification_theorems

end MiniSardMorse