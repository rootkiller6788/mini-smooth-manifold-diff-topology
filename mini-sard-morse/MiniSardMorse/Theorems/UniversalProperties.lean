/- Universal Properties -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def universalproperties_theorems : List (String × String) := [
  ("Universal coefficient", "H_*(X;G) from H_*(X) and G"),
  ("Kunneth formula", "H_*(X*Y) from H_*(X) and H_*(Y)"),
  ("Mayer-Vietoris", "H_*(U u V) from H_*(U), H_*(V), H_*(U n V)"),
  ("Excision", "H_*(X,A) = H_*(X-U, A-U)"),
  ("Homotopy invariance", "Homotopic maps induce same homology"),
  ("Suspension isomorphism", "H_k(X) = H_{k+1}(SX)"),
  ("Thom isomorphism", "H^*(E) = H^{*-n}(B) for vector bundles"),
]

#eval "== UniversalProperties =="
#eval universalproperties_theorems

end MiniSardMorse