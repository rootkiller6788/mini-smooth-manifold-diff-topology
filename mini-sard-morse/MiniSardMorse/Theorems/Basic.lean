/- Basic Theorems -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def basic_theorems : List (String × String) := [
  ("Theorem (Sard)", "Critical values of Ck map have measure zero if k>=max(1,m-n+1)"),
  ("Theorem (Morse Lemma)", "Local normal form f(x)=f(p)-x1^2-...-xk^2+x_{k+1}^2+...+xn^2"),
  ("Theorem (Morse Ineq)", "mk >= bk, alternating sum bounds"),
  ("Theorem (Reeb)", "Closed manifold + Morse fn with 2 crit pts = sphere"),
  ("Theorem (Handle Decomp)", "Morse function gives handle decomposition"),
  ("Theorem (CW Structure)", "Morse function gives CW complex structure"),
]

#eval "== Basic =="
#eval basic_theorems

end MiniSardMorse