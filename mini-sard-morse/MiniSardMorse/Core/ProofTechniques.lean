/- Proof Techniques Catalog -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def proof_techniques_catalog : List (String × String) := [
  ("Measure Theory", "Covering lemmas, Fubini theorem, Hausdorff dimension estimates for Sard theorem"),
  ("Diagonalization", "Taylor expansion + orthogonal diagonalization for Morse lemma proof"),
  ("Homological Algebra", "Chain complexes, spectral sequences for Morse inequalities"),
  ("Handle Cancellation", "Geometric cancellation of complementary handles"),
  ("Gradient Flow", "Analysis of ODEs, stable manifold theorem for Morse-Smale condition"),
  ("Transversality", "Thom transversality theorem for generic position arguments"),
  ("Cerf Theory", "Families of Morse functions, birth-death of critical points"),
  ("Atiyah-Bott Localization", "Equivariant cohomology, fixed point formulas"),
  ("Pseudo-Holomorphic Curves", "Gromov compactness for Floer homology"),
  ("Spectral Sequences", "Leray-Serre, Morse-Bott spectral sequences"),
  ("Model Categories", "Homotopy theory approach to Morse theory (Cohen-Jones-Segal)"),
  ("Microlocal Sheaf Theory", "Sheaf-theoretic Morse theory (Kashiwara-Schapira)"),
]

#eval "== ProofTechniques =="
#eval proof_techniques_catalog

end MiniSardMorse