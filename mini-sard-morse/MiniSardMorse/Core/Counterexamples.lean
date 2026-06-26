/- Counterexamples -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def counterexamples : List (String × String) := [
  ("Sard fails for C0 maps", "Space-filling curves have all points as critical values"),
  ("Morse lemma fails at degenerate pt", "f(x)=x^3: degenerate critical point, no quadratic form"),
  ("Reeb fails for open manifold", "(0,1) has 2 crit pts but is not a sphere"),
  ("Morse ineq not sharp", "Some mflds have m_k > b_k (extra cancellations)"),
  ("h-cobordism fails in dim 4", "Freedman/Donaldson: exotic R4 exist"),
  ("Morse-Bott required for symmetry", "Moment maps have degenerate critical manifolds"),
  ("MS condition not generic in families", "Cerf theory: birth-death unavoidable"),
  ("Gradient flow not global", "Need Palais-Smale for non-compact"),
  ("Morse fails for non-smooth", "Need stratified Morse theory"),
  ("Morse homology over Z fails", "Need orientations on moduli spaces"),
]

#eval "== Counterexamples =="
#eval counterexamples

end MiniSardMorse