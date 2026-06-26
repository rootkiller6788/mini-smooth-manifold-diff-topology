/- History of Sard Theorem and Morse Theory -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def history : List (String × String) := [
  ("1925", "Morse publishes fundamental papers on critical points of functions"),
  ("1934", "Morse: The Calculus of Variations in the Large"),
  ("1942", "Sard publishes his theorem on critical values"),
  ("1954", "Thom establishes cobordism theory"),
  ("1958", "Bott periodicity theorem uses Morse theory on loop spaces"),
  ("1960", "Smale proves h-cobordism theorem using handle decompositions"),
  ("1961", "Smale proves Poincare conjecture for dim >= 5 using Morse theory"),
  ("1962", "Milnor publishes Morse Theory based on Spivak notes"),
  ("1965", "Palais extends Morse theory to infinite-dimensional Hilbert manifolds"),
  ("1982", "Witten relates Morse theory to supersymmetric quantum mechanics"),
  ("1988", "Floer develops Floer homology using infinite-dimensional Morse theory"),
  ("1990", "Cohen-Jones-Segal develop equivariant Morse theory"),
  ("2000", "Fukaya categories and Morse homotopy theory emerge"),
  ("2007", "Cohomotopy and framed Morse theory developments"),
  ("2015", "Morse theory in derived algebraic geometry (Joyce)"),
]

#eval "== History =="
#eval history

end MiniSardMorse