/- Counterexamples Catalog -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def examples_counter : List (String × String) := [
  ("Sard fails C0", "Space-filling curves"),
  ("Morse lemma fails", "f(x)=x3 degenerate"),
  ("Reeb fails non-closed", "(0,1) not sphere"),
  ("Morse ineq not sharp", "Extra cancellations"),
  ("h-cobordism fails dim4", "Exotic R4"),
  ("Morse-Bott needed", "Moment maps"),
  ("MS not generic", "Cerf theory"),
  ("Gradient flow non-global", "Need Palais-Smale"),
  ("Morse fails non-smooth", "Stratified Morse"),
  ("Morse hom over Z", "Need orientations"),
]

#eval "== Counters =="
#eval examples_counter

end MiniSardMorse