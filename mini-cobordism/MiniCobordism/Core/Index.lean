import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def completeIndex : List (String × String) := [
  ("A-hat genus", "Spin cobordism invariant; index of Dirac operator"),
  ("Adams spectral sequence", "Computes pi_*^S from Ext_A(F_2,F_2)"),
  ("Adams-Novikov SS", "Uses MU_*MU; more efficient than Adams SS"),
  ("Atiyah-Singer", "index(D) = integral A-hat(M) ch(E)"),
  ("Bordism", "Synonym for cobordism"),
  ("Boundary", "dM; d^2 = 0"),
  ("Characteristic number", "<c_I(M), [M]>; detects cobordism"),
  ("Chromatic filtration", "L_0 < L_1 < L_2 < ... < Sp"),
  ("Cobordism class", "Equivalence class under cobordism relation"),
  ("Cobordism group O_n", "Abelian group of cobordism classes"),
  ("Cobordism ring O_*", "Graded ring under Cartesian product"),
  ("Complex cobordism MU", "Torsion-free; universal FGL"),
  ("Connected sum", "M#N; cobordant to M U N"),
  ("Disjoint union", "Group operation on O_n"),
  ("Exotic sphere", "Homeomorphic to S^n but not diffeomorphic"),
  ("Formal group law", "F(x,y) = x+y+...; MU_* is universal"),
  ("Framed cobordism", "= pi_*^S; via Pontryagin-Thom"),
  ("G/O", "Classifying space for normal invariants"),
  ("Handle", "D^k x D^{n-k} attached along boundary"),
  ("h-cobordism", "Cobordism with homotopy equivalences as inclusions"),
  ("Hirzebruch signature", "sigma(M) = <L_k(p_1,...,p_k), [M]>"),
  ("Kervaire invariant", "Framed invariant; detects exotic spheres in dim 4k+2"),
  ("L-genus", "Multiplicative sequence for signature formula"),
  ("L-group", "Surgery obstruction group L_n(Z[pi_1])"),
  ("Lazard ring", "MU_*; universal formal group law ring"),
  ("Morse theory", "Critical points -> handle decomposition"),
  ("Nilpotence theorem", "f nilpotent iff MU_*(f)=0"),
  ("Normal invariant", "Degree-1 normal map; N(M) = [M, G/O]"),
  ("Novikov conjecture", "Higher signatures are homotopy invariants"),
  ("Pontryagin number", "Oriented bordism invariant"),
  ("Pontryagin-Thom", "O_n = pi_{n+k}(MO(k))"),
  ("s-cobordism", "h-cobordism with vanishing Whitehead torsion"),
  ("Signature", "sigma(M); oriented bordism invariant; ring homomorphism"),
  ("Stiefel-Whitney number", "Unoriented bordism invariant (mod 2)"),
  ("Surgery", "Remove S^k x D^{n-k}, add D^{k+1} x S^{n-k-1}"),
  ("Surgery exact sequence", "S(M) -> N(M) -> L_n(Z[pi_1])"),
  ("Thom space", "Th(E) = D(E)/S(E)"),
  ("Thom spectrum", "MO = {MO(k)}; represents bordism"),
  ("TMF", "Topological modular forms; chromatic height 2"),
  ("Whitehead torsion", "tau(f) in Wh(pi_1); obstruction to s-cobordism"),
  ("Whitney trick", "Make spheres disjoint when dim >= 5")
]

#eval "== Complete Index =="
#eval completeIndex


end MiniCobordism
