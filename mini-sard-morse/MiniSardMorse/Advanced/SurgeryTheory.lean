/- Surgery Theory -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def surgery_data : List (String × String) := [
  ("Surgery sequence", "S(M) -> N(M) -> L_n(pi1)"),
  ("Browder-Novikov-Wall", "Classify mflds in homotopy type"),
  ("Assembly map", "L-theory + Novikov conjecture"),
  ("Exotic spheres", "Theta_n = exotic n-spheres"),
  ("Kervaire-Milnor", "Exotic spheres via stable homotopy"),
]

#eval "== SurgeryTheory =="
#eval surgery_data

end MiniSardMorse