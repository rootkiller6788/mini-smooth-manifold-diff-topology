/- Geometric Applications -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def geom_apps : List (String × String) := [
  ("Bott periodicity", "Morse on loop spaces"),
  ("Arnold conjecture", "Fixed pts of Hamiltonian diffeos"),
  ("Moment maps", "Morse-Bott on symplectic quotients"),
  ("Einstein metrics", "Crit pts of Hilbert-Einstein"),
  ("Minimal surfaces", "Morse for area functional"),
]

#eval "== ToGeometry =="
#eval geom_apps

end MiniSardMorse