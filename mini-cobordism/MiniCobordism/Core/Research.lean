import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def currentResearchDirections : List String := [
  "Kervaire invariant 1 in dimension 126 (last open case)",
  "Novikov conjecture for all finitely presented groups",
  "Borel conjecture for all aspherical manifolds",
  "Complete computation of pi_n^S for high n (n > 100)",
  "String bordism and TMF: complete structure of MString_*",
  "Existence of exotic smooth structures on S^4",
  "Classification of smooth structures on 4-manifolds",
  "Elliptic cohomology at higher chromatic heights",
  "Derived algebraic geometry and chromatic homotopy",
  "Factorization homology and extended TQFTs",
  "Supersymmetric field theories and TMF (Stolz-Teichner)",
  "Condensed mathematics and new foundations for topology"
]

def researchFrontiersDetail : List String := [
  "Chromatic homotopy theory: organizing stable homotopy by height",
  "Topological modular forms: derived algebraic geometry meets topology",
  "Cobordism hypothesis: classification of fully extended TQFTs",
  "Factorization homology: integrating algebras over manifolds",
  "Calabi-Yau cobordism and mirror symmetry",
  "Khovanov homology and link cobordism categories",
  "Symplectic field theory and contact homology",
  "Equivariant cobordism and global homotopy theory"
]

#eval "== Research Frontiers =="
#eval currentResearchDirections
#eval researchFrontiersDetail


end MiniCobordism
