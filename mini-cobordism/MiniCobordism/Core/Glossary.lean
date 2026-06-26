import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def glossary : List (String × String) := [
  ("Bordism", "Alternative name for cobordism"),
  ("Characteristic number", "Topological invariant: <c_I(M), [M]>"),
  ("Cobordism", "M ~ N iff M U N = boundary of W"),
  ("Formal group law", "F(x,y) = x+y+sum a_{ij} x^i y^j"),
  ("G/O", "Fiber of BO -> BG; classifies vector bundle reductions"),
  ("h-cobordism", "Cobordism where inclusions are homotopy equivalences"),
  ("Handle", "D^k x D^{n-k} attached along S^{k-1} x D^{n-k}"),
  ("L-genus", "Multiplicative sequence giving signature from Pontryagin numbers"),
  ("L-group", "Wall surgery obstruction group L_n(Z[pi_1])"),
  ("Morse function", "Smooth function with nondegenerate critical points"),
  ("Normal invariant", "Degree-1 normal map M -> X"),
  ("Pontryagin-Thom", "Isomorphism O_n = pi_{n+k}(MO(k))"),
  ("s-cobordism", "h-cobordism with vanishing Whitehead torsion"),
  ("Signature", "sigma(M) = number of positive - negative eigenvalues"),
  ("Steenrod algebra", "Algebra of stable cohomology operations mod p"),
  ("Surgery", "Remove S^k x D^{n-k}, attach D^{k+1} x S^{n-k-1}"),
  ("Thom space", "Th(E) = D(E)/S(E), one-point compactification of E"),
  ("Whitehead torsion", "tau(f) in Wh(pi_1), obstruction to simple homotopy"),
  ("Whitney trick", "Cancel intersections of spheres when dim >= 5"),
  ("Wu class", "v_k such that Sq^k(x) = v_k U x for all x")
]

def notationGuide : List (String × String) := [
  ("O_n^O", "Unoriented cobordism group in dimension n"),
  ("O_n^SO", "Oriented cobordism group in dimension n"),
  ("O_n^U", "Complex cobordism group (MU_n)"),
  ("O_n^fr", "Framed cobordism group (= pi_n^S)"),
  ("pi_n^S", "n-th stable stem (stable homotopy group of spheres)"),
  ("N_*", "Unoriented cobordism ring (= O_*^O)"),
  ("MU_*", "Complex cobordism ring (= O_*^U)"),
  ("MO(k)", "Thom space of universal O(k)-bundle"),
  ("MSO(k)", "Thom space of universal SO(k)-bundle"),
  ("MU(k)", "Thom space of universal U(k)-bundle"),
  ("G/O", "Fiber of BO -> BG (spherical fibrations)"),
  ("L_n(G)", "Wall surgery obstruction group"),
  ("Wh(G)", "Whitehead group = K_1(Z[G])/(+/-G)"),
  ("S(X)", "Structure set of manifold X"),
  ("N(X)", "Normal invariants set of X"),
  ("bP_{n+1}", "Homotopy spheres bounding parallelizable manifolds"),
  ("Theta_n", "Group of homotopy n-spheres (Kervaire-Milnor)")
]

def dimensionSpecialFacts : List (Nat × List String) := [
  (1, ["Classifies R; O_1^SO = 0"]),
  (2, ["Classifies surfaces; RP^2 is generator of O_2^O"]),
  (3, ["3-manifolds all bound (O_3^SO = 0); h-cobordism trivial"]),
  (4, ["Special: exotic R^4; DIFF != TOP; SW invariants"]),
  (5, ["h-cobordism theorem begins; Whitney trick works"]),
  (6, ["Stable range: handle cancellations work"]),
  (7, ["Exotic spheres: 28 smooth structures on S^7"])
]

#eval "== Glossary =="
#eval glossary
#eval notationGuide
#eval dimensionSpecialFacts


end MiniCobordism
