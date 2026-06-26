/- Connections -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def connections : List (String × String) := [
  ("Algebraic Topology", "Morse homology = singular homology; CW from Morse"),
  ("Symplectic Geometry", "Floer homology; Arnold conjecture"),
  ("Gauge Theory", "Instanton Floer; Donaldson invariants"),
  ("Geometric Analysis", "Harmonic maps; minimal surfaces"),
  ("Algebraic Geometry", "Morse on varieties; vanishing cycles"),
  ("String Theory", "Mirror symmetry; Fukaya categories"),
  ("Knot Theory", "Heegaard Floer; Khovanov homology"),
  ("Contact Geometry", "Contact homology; symplectic field theory"),
  ("Low-dim Topology", "Heegaard splittings; surgery theory"),
  ("Category Theory", "Fukaya cats; A-infinity structures"),
  ("Representation Theory", "Kirwan surjectivity; geometric quantization"),
  ("Combinatorics", "Discrete Morse; persistent homology"),
]

#eval "== Connections =="
#eval connections

end MiniSardMorse