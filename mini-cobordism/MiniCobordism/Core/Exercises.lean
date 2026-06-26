import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def exerciseList : List String := [
  "1. Show that all spheres bound: S^n = boundary of D^{n+1}",
  "2. Compute Stiefel-Whitney numbers of RP^2 and RP^3",
  "3. Prove: if M and N are cobordant, then chi(M) = chi(N) mod 2",
  "4. Show that CP^2 has signature 1 and thus generates O_4^SO",
  "5. State the Pontryagin-Thom isomorphism",
  "6. Prove cobordism is an equivalence relation",
  "7. Show that disjoint union makes O_n an abelian group",
  "8. Explain why the h-cobordism theorem requires dim >= 5",
  "9. Compute O_*^SO for n = 0,1,2,3,4",
  "10. State Thom theorem on unoriented cobordism ring"
]

def exerciseHints : List (String × String) := [
  ("Ex 1", "D^{n+1} = {{x in R^{n+1} : |x| <= 1}}, boundary = S^n"),
  ("Ex 2", "w(RP^n) = (1+a)^{n+1} where a = w_1; si w_1^n[RP^n] = 1 mod 2"),
  ("Ex 3", "chi(M U N) = chi(M) + chi(N) - chi(M cap N)"),
  ("Ex 4", "p_1[CP^2] = 3, so by Hirzebruch: sigma = p_1/3 = 1"),
  ("Ex 5", "O_n = pi_{n+k}(MO(k)) for k sufficiently large"),
  ("Ex 6", "Reflexive: M x [0,1] is cobordism M to M"),
  ("Ex 7", "Disjoint union is associative, commutative; empty is identity"),
  ("Ex 8", "Whitney trick needs 2+2 <= p+q+1 => p+q >= 3 => dim >= 5"),
  ("Ex 9", "O_0=Z (point), O_1=O_2=O_3=0, O_4=Z (CP^2)"),
  ("Ex 10", "N_* = F_2[x_2, x_4, x_5, x_6, x_8, x_9, x_10, ...]")
]

def furtherReading : List String := [
  "Milnor - Lectures on the h-Cobordism Theorem (1965)",
  "Stong - Notes on Cobordism Theory (1968)",
  "Wall - Surgery on Compact Manifolds (1970)",
  "Ravenel - Complex Cobordism and Stable Homotopy (1986)",
  "May - A Concise Course in Algebraic Topology (1999)"
]

#eval "== Exercises =="
#eval exerciseList
#eval exerciseHints
#eval furtherReading


end MiniCobordism
