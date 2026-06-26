/- Knowledge Graph -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def knowledge_graph : List (String × List String) := [
  ("Sard Theorem", ["Regular Values", "Transversality", "Brown-Sard Theorem", "Thom-Boardman Singularities"]),
  ("Morse Theory", ["Morse Lemma", "Morse Inequalities", "Handle Decomposition", "CW Complex"]),
  ("Gradient Flow", ["Morse-Smale Condition", "Stable/Unstable Manifolds", "Morse Homology", "Thom-Smale Complex"]),
  ("h-Cobordism", ["Whitehead Torsion", "s-Cobordism", "Surgery Theory", "Exotic Spheres"]),
  ("Floer Theory", ["Lagrangian Floer", "Instanton Floer", "Heegaard Floer", "Seiberg-Witten Floer"]),
  ("Morse-Bott", ["Critical Manifolds", "Equivariant Localization", "Atiyah-Bott Formula", "Moment Map"]),
  ("Equivariant Morse", ["G-Manifolds", "Kirwan Map", "Borel Construction", "Localization Theorem"]),
  ("Applications", ["Gauge Theory", "Symplectic Geometry", "String Topology", "Persistent Homology"]),
]

#eval "== KnowledgeGraph =="
#eval knowledge_graph

end MiniSardMorse