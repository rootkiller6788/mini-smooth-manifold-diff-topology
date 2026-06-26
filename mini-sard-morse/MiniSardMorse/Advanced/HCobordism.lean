/- h-Cobordism -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def hc_data : List (String × String) := [
  ("Smale 1961", "h-cobordism dim>=5 trivial"),
  ("Barden-Mazur-Stallings", "s-cobordism + Whitehead torsion"),
  ("Freedman 1982", "Topological h-cobordism dim 4"),
  ("Donaldson 1983", "Smooth h-cobordism fails dim 4"),
  ("Perelman 2003", "Geometrization + Poincare dim 3"),
]

#eval "== HCobordism =="
#eval hc_data

end MiniSardMorse