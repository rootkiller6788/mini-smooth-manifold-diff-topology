/- Topological Applications -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def topo_apps : List (String × String) := [
  ("h-cobordism", "Classify mflds up to cobordism"),
  ("Surgery theory", "Handle attachments"),
  ("Exotic spheres", "Smooth structures"),
  ("Cerf theory", "Families of Morse functions"),
  ("Kirby calculus", "Handle decomp of 4-mflds"),
]

#eval "== ToTopology =="
#eval topo_apps

end MiniSardMorse