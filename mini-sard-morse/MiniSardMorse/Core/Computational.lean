/- Computational Morse Theory -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def computational_data : List (String × String) := [
  ("S0", "H0=Z2,m0=2"),
  ("S1", "H0=Z,H1=Z,m0=1,m1=1"),
  ("S2", "H0=Z,H2=Z,m0=1,m2=1,chi=2"),
  ("S3", "H0=Z,H3=Z,chi=0"),
  ("S4", "H0=Z,H4=Z,chi=2"),
  ("T2", "H0=Z,H1=Z2,H2=Z,chi=0"),
  ("RP2", "H0=Z,H1=Z/2,H2=Z,chi=1"),
  ("CP1", "H0=Z,H2=Z,chi=2=S2"),
  ("CP2", "H0=Z,H2=Z,H4=Z,chi=3"),
  ("CP3", "chi=4"),
  ("O0", "Z/2Z"),
  ("O1", "0"),
  ("O2", "Z/2Z"),
  ("O3", "0"),
  ("O4", "Z/2Z x Z/2Z"),
  ("pi0S", "Z"),
  ("pi1S", "Z/2Z"),
  ("pi2S", "Z/2Z"),
  ("pi3S", "Z/24Z"),
  ("S1xS1", "H0=Z,H1=Z2,H2=Z"),
  ("S2xS2", "H0=Z,H2=Z2,H4=Z,chi=4"),
]

#eval "== Computational =="
#eval computational_data

end MiniSardMorse