/- Exercises -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def exercises : List (String × String) := [
  ("Find crit pts of height on S2", "Two: max at north (idx 2), min at south (idx 0)"),
  ("Morse indices for height on T2", "min(0), 2 saddles(idx 1), max(2)"),
  ("Verify Morse ineq for RP2", "m0>=b0, m1>=b1, m2>=b2; all sharp"),
  ("Prove chi = sum (-1)^k m_k", "Morse homology: chi = alt sum of chain ranks"),
  ("Show CPn has perfect Morse", "Moment map: crit pts at coordinate axes"),
  ("Construct hdl decomp of S2", "0-handle + cancelling pair + 2-handle"),
  ("Prove Reeb theorem", "2 crit pts => 0+dim handles => sphere"),
  ("Compute Morse hom of Sn", "H_k = Z for k=0,n; 0 else (perfect)"),
  ("MS condition genericity", "Perturb metric for transversality"),
  ("Morse idx = Hessian neg eig", "Morse index = count of negative eigenvalues"),
]

#eval "== Exercises =="
#eval exercises

end MiniSardMorse