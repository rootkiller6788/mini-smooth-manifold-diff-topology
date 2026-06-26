/- Theorems Catalog -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def theorems_catalog : List (String × String) := [
  ("Sard Theorem", "Critical values of C^k map f:M^m->N^n have measure zero if k>=max(1,m-n+1)"),
  ("Morse Lemma", "Local normal form near nondegenerate critical point"),
  ("Weak Morse Inequalities", "m_k >= b_k for all k"),
  ("Strong Morse Inequalities", "Alternating sums bound Betti numbers"),
  ("Lacunary Principle", "If m_k*m_{k+1}=0 for all k, then m_k=b_k for all k"),
  ("Reeb Theorem", "Closed manifold + Morse fn with 2 crit pts = sphere"),
  ("h-Cobordism Theorem", "Simply connected h-cobordisms of dim>=5 are trivial"),
  ("s-Cobordism Theorem", "h-cobordisms classified by Whitehead torsion"),
  ("Handle Decomposition Theorem", "Morse fn gives handle decomposition"),
  ("CW Structure Theorem", "Morse fn gives CW complex structure"),
  ("Morse Homology Theorem", "Morse homology = singular homology"),
  ("Poincare-Hopf Theorem", "Sum of indices = Euler characteristic"),
  ("Smale Transversality", "Morse-Smale condition is generic"),
  ("Cancellation Theorem", "Cancelling pair of critical points = trivial cobordism"),
  ("Isotopy Extension", "Isotopy of submanifold extends to ambient isotopy"),
]

#eval "== TheoremCatalog =="
#eval theorems_catalog

end MiniSardMorse