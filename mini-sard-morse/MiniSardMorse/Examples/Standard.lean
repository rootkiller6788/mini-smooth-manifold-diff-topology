/- Standard Examples -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def standard_examples : List (String × String) := [
  ("Height on Sn", "2 crit pts: min(0), max(n)"),
  ("Height on T2", "4 crit pts: min(0), saddle(1), saddle(1), max(2)"),
  ("Height on RP2", "3 crit pts: min(0), saddle(1), max(2)"),
  ("Moment map CPn", "Crit pts at coordinate axes, idx 0,2,...,2n"),
  ("Distance squared", "Unique min at p, idx 0"),
  ("Energy on loop space", "Crit pts = closed geodesics"),
  ("Symplectic action", "Crit pts = periodic orbits"),
  ("Chern-Simons", "Crit pts = flat connections on 3-mflds"),
  ("Yang-Mills", "Crit pts = instantons on 4-mflds"),
  ("Hilbert-Einstein", "Crit pts = Ricci-flat metrics"),
]

#eval "== Standard =="
#eval standard_examples

end MiniSardMorse