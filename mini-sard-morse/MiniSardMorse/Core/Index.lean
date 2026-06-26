/- Sard-Morse Index -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def index_entries : List (String × String) := [
  ("Arnold conjecture", "See main text for details on Arnold conjecture"),
  ("Atiyah-Bott localization", "See main text for details on Atiyah-Bott localization"),
  ("Betti numbers", "See main text for details on Betti numbers"),
  ("Bott periodicity", "See main text for details on Bott periodicity"),
  ("Cerf theory", "See main text for details on Cerf theory"),
  ("Cobordism", "See main text for details on Cobordism"),
  ("Critical point", "See main text for details on Critical point"),
  ("Critical value", "See main text for details on Critical value"),
  ("CW complex", "See main text for details on CW complex"),
  ("Diffeomorphism", "See main text for details on Diffeomorphism"),
  ("Discrete Morse", "See main text for details on Discrete Morse"),
  ("Equivariant Morse", "See main text for details on Equivariant Morse"),
  ("Euler characteristic", "See main text for details on Euler characteristic"),
  ("Floer homology", "See main text for details on Floer homology"),
  ("Gradient flow", "See main text for details on Gradient flow"),
  ("h-cobordism", "See main text for details on h-cobordism"),
  ("Handle decomposition", "See main text for details on Handle decomposition"),
  ("Handlebody", "See main text for details on Handlebody"),
  ("Hessian", "See main text for details on Hessian"),
  ("Index (Morse)", "See main text for details on Index (Morse)"),
  ("Instanton", "See main text for details on Instanton"),
  ("Kervaire invariant", "See main text for details on Kervaire invariant"),
  ("Kirby calculus", "See main text for details on Kirby calculus"),
  ("Lacunary principle", "See main text for details on Lacunary principle"),
  ("Loop space", "See main text for details on Loop space"),
  ("Moment map", "See main text for details on Moment map"),
  ("Morse-Bott", "See main text for details on Morse-Bott"),
  ("Morse function", "See main text for details on Morse function"),
  ("Morse homology", "See main text for details on Morse homology"),
  ("Morse inequalities", "See main text for details on Morse inequalities"),
  ("Morse lemma", "See main text for details on Morse lemma"),
  ("Morse numbers", "See main text for details on Morse numbers"),
  ("Morse polynomial", "See main text for details on Morse polynomial"),
  ("Morse-Smale", "See main text for details on Morse-Smale"),
  ("Nondegenerate critical point", "See main text for details on Nondegenerate critical point"),
  ("Palais-Smale", "See main text for details on Palais-Smale"),
  ("Perfect Morse", "See main text for details on Perfect Morse"),
  ("Poincare polynomial", "See main text for details on Poincare polynomial"),
  ("Pontryagin-Thom", "See main text for details on Pontryagin-Thom"),
  ("Reeb graph", "See main text for details on Reeb graph"),
  ("Reeb theorem", "See main text for details on Reeb theorem"),
  ("Regular value", "See main text for details on Regular value"),
  ("Sard theorem", "See main text for details on Sard theorem"),
  ("s-cobordism", "See main text for details on s-cobordism"),
  ("Smale condition", "See main text for details on Smale condition"),
  ("Spectral sequence", "See main text for details on Spectral sequence"),
  ("Stable manifold", "See main text for details on Stable manifold"),
  ("Surgery theory", "See main text for details on Surgery theory"),
  ("Thom transversality", "See main text for details on Thom transversality"),
  ("Unstable manifold", "See main text for details on Unstable manifold"),
  ("Whitehead torsion", "See main text for details on Whitehead torsion"),
]

#eval "== Index =="
#eval index_entries

end MiniSardMorse