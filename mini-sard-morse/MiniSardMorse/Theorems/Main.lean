/- Main Theorems -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def main_theorems : List (String × String) := [
  ("Sard Theorem", "Critical values have measure zero"),
  ("Morse Lemma", "Local quadratic normal form"),
  ("Morse Inequalities", "mk >= bk, strong alternating form"),
  ("Handle Decomposition", "Morse fn => handlebody structure"),
  ("Reeb Theorem", "2 critical points => sphere"),
  ("h-Cobordism", "Simply connected dim>=5 => product"),
  ("Morse Homology", "H_*^Morse(M;f) = H_*^sing(M)"),
  ("Poincare-Hopf", "Sum of indices = chi(M)"),
]

#eval "== Main =="
#eval main_theorems

end MiniSardMorse