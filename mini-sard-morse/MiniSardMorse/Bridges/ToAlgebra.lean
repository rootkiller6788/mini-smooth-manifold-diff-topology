/- Algebraic Applications -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def algebra_apps : List (String × String) := [
  ("Morse homology", "C_* from crit pts, boundary = gradient count"),
  ("Morse-Witten", "Chain complex = singular homology"),
  ("Floer homology", "Infinite-dim Morse on loop spaces"),
  ("Lagrangian Floer", "Intersections of Lagrangians"),
  ("Heegaard Floer", "3-manifold invariants"),
]

#eval "== ToAlgebra =="
#eval algebra_apps

end MiniSardMorse