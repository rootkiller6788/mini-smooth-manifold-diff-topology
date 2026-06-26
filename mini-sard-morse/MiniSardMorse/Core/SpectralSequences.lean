/- Spectral Sequences in Morse Theory -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def spectral_sequences : List (String × String) := [
  ("Morse-Bott SS", "E1 = H(N_p) => H(M)"),
  ("Leray-Serre", "E2 = H(B;H(F)) => H(E)"),
  ("Atiyah-Hirzebruch", "E2 = H(X;h(pt)) => h(X)"),
  ("Adams", "Ext_A(H*(X),F2) => piS(X)"),
  ("Adams-Novikov", "Ext_{MU*MU}(MU*(X),MU*) => piS(X)"),
  ("Bockstein", "Z and Z/p homology relation"),
  ("Serre", "E2 = H(B;H(F)) => H(E)"),
  ("Eilenberg-Moore", "H*(fiber) from H*(base) and H*(total)"),
  ("Cobar", "Loop space cohomology"),
  ("Morse-Bott convergence", "SS from Morse-Bott => homology"),
  ("Floer-Novikov", "Circle-valued Morse, Novikov homology"),
  ("Rothenberg-Steenrod", "Cohomology of classifying spaces"),
  ("Vanishing", "Conditions for SS collapse"),
]

#eval "== SpectralSequences =="
#eval spectral_sequences

end MiniSardMorse