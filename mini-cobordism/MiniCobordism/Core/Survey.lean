import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def allCobordismTheories : List (String × String × String) := [
  ("O_*^O (Unoriented)", "Thom 1954", "F_2[x_2, x_4, x_5, x_6, x_8, ...]"),
  ("O_*^SO (Oriented)", "Wall 1960", "Polynomial + 2-torsion from dim 5"),
  ("MU_* (Complex)", "Milnor-Novikov 1960", "Z[a_1, a_2, ...] (torsion-free)"),
  ("O_*^fr (Framed)", "Pontryagin 1950", "pi_*^S (stable homotopy)"),
  ("O_*^Spin", "ABP 1967", "Spin cobordism"),
  ("O_*^String", "Hopkins-Mahowald 2005", "String cobordism -> TMF"),
  ("MSp_* (Symplectic)", "Novikov 1962", "Symplectic cobordism"),
  ("MOh_* (Connective)", "ABP 1967", "Connective cobordism"),
  ("BP_*", "Brown-Peterson 1966", "p-local cobordism spectrum")
]

def allCharacteristicClasses : List (Nat × String × String) := [
  (1, "w_1 (SW)", "Detects orientability: w_1 = 0 iff orientable"),
  (2, "w_2 (SW)", "Detects spin: w_2 = 0 iff spin"),
  (3, "w_3 (SW)", "Further obstruction"),
  (1, "p_1 (Pontryagin)", "p_1[M^4] = 3*sigma(M)"),
  (2, "p_2 (Pontryagin)", "Appears in L-genus for 8-manifolds"),
  (1, "c_1 (Chern)", "Euler class of complex line bundle"),
  (2, "c_2 (Chern)", "Instanton number on 4-manifolds")
]

def cohomologyOperations : List (String × String) := [
  ("Sq^i", "Steenrod squares: H^*(-;F_2) -> H^{*+i}(-;F_2)"),
  ("P^i", "Steenrod reduced powers"),
  ("Beta", "Bockstein: connecting homomorphism"),
  ("Phi", "Adams operations in K-theory"),
  ("ch", "Chern character: K -> H^*(-;Q)"),
  ("td", "Todd genus: complex analogue of A-hat genus")
]

def allThomSpectra : List (String × String) := [
  ("MO", "Thom spectrum of universal O-bundle -> unoriented bordism"),
  ("MSO", "Thom spectrum of universal SO-bundle -> oriented bordism"),
  ("MU", "Thom spectrum of universal U-bundle -> complex bordism"),
  ("MSp", "Thom spectrum of universal Sp-bundle -> symplectic bordism"),
  ("MSpin", "Thom spectrum of universal Spin-bundle -> spin bordism"),
  ("MString", "Thom spectrum of universal String-bundle -> string bordism"),
  ("BP", "Brown-Peterson spectrum (p-local summand of MU)"),
  ("HZ", "Eilenberg-MacLane spectrum (ordinary cohomology)"),
  ("KU", "Complex K-theory spectrum"),
  ("KO", "Real K-theory spectrum"),
  ("TMF", "Topological modular forms spectrum")
]

#eval "== Theory Survey =="
#eval allCobordismTheories
#eval allCharacteristicClasses
#eval cohomologyOperations
#eval allThomSpectra


end MiniCobordism
