import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def faq : List (String × String) := [
  ("What is cobordism?", "M and N are cobordant if their disjoint union is the boundary of a compact manifold W"),
  ("Why is cobordism an equivalence relation?", "Reflexive: Mx[0,1] bounds M U M; symmetric: reverse W; transitive: glue along common boundary"),
  ("What is O_n?", "The group of cobordism classes of closed n-manifolds under disjoint union"),
  ("What does Thom theorem say?", "N_* = F_2[x_2, x_4, x_5, x_6, x_8, ...] where x_n not of form 2^i-1"),
  ("What is Pontryagin-Thom?", "Isomorphism O_n = pi_{n+k}(MO(k)), reducing cobordism to homotopy theory"),
  ("What is the h-cobordism theorem?", "Simply connected h-cobordant manifolds of dim >= 5 are diffeomorphic"),
  ("Why dim >= 5?", "Whitney trick needs room to embed a 2-disk disjointly"),
  ("What are exotic spheres?", "Smooth manifolds homeomorphic but not diffeomorphic to S^n"),
  ("What is MU_*?", "Complex cobordism ring = Z[a_1,a_2,...] = Lazard ring (universal formal group law)"),
  ("What is the cobordism hypothesis?", "Framed TQFTs are determined by their value on a point")
]

def commonMisconceptions : List String := [
  "Cobordism does NOT mean diffeomorphic (much coarser)",
  "All spheres DO bound (S^n = boundary of D^{n+1})",
  "O_n is NOT zero for all n (RP^2 generates O_2^O = Z/2)",
  "Signature is NOT always 0 (CP^2 has signature 1)",
  "h-cobordant does NOT imply diffeomorphic in dim 4",
  "Stiefel-Whitney numbers are NOT integer-valued (they are mod 2)",
  "Pontryagin numbers do NOT detect all torsion (need signature too)",
  "MU_* is NOT the same as O_*^U (same group, different name)",
  "Framed cobordism groups are NOT all finite (pi_0^S = Z)"
]

#eval "== FAQ =="
#eval faq
#eval commonMisconceptions


end MiniCobordism
