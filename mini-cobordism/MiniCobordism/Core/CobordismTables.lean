import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def unorientedFullTable : List (Nat × String) := [
  (0, "Z/2"), (1, "0"), (2, "Z/2"), (3, "0"), (4, "(Z/2)^2"),
  (5, "Z/2"), (6, "(Z/2)^3"), (7, "Z/2"), (8, "(Z/2)^5"),
  (9, "(Z/2)^4"), (10, "(Z/2)^7"), (11, "(Z/2)^4"), (12, "(Z/2)^11"),
  (13, "(Z/2)^6"), (14, "(Z/2)^16"), (15, "(Z/2)^8")
]

def orientedFullTable : List (Nat × String) := [
  (0, "Z"), (1, "0"), (2, "0"), (3, "0"), (4, "Z"),
  (5, "Z/2"), (6, "0"), (7, "0"), (8, "Z+Z"),
  (9, "(Z/2)^2"), (10, "Z/2"), (11, "Z/2"), (12, "Z^3"),
  (13, "(Z/2)^2"), (14, "Z/2"), (15, "(Z/2)^2")
]

def complexCobordismRanks : List (Nat × Nat) := [
  (0, 1), (2, 1), (4, 2), (6, 3), (8, 5), (10, 7), (12, 11),
  (14, 15), (16, 22), (18, 30), (20, 42)
]

def stableStemsTable : List (Nat × String) := [
  (0, "Z"), (1, "Z/2"), (2, "Z/2"), (3, "Z/24"), (4, "0"),
  (5, "0"), (6, "Z/2"), (7, "Z/240"), (8, "(Z/2)^2"),
  (9, "(Z/2)^3"), (10, "Z/6"), (11, "Z/504"), (12, "0"),
  (13, "Z/3"), (14, "(Z/2)^2"), (15, "Z/480+Z/2"),
  (16, "(Z/2)^2"), (17, "(Z/2)^4"), (18, "Z/8+Z/2"),
  (19, "Z/264+(Z/2)^2"), (20, "Z/24")
]

def exoticSpheresFullTable : List (Nat × Nat) := [
  (5, 1), (6, 1), (7, 28), (8, 2), (9, 8), (10, 6), (11, 992),
  (12, 1), (13, 3), (14, 2), (15, 16256)
]

def lGenusTable : List (Nat × String) := [
  (0, "L_0 = 1"), (1, "L_1 = p_1/3"), (2, "L_2 = (7p_2 - p_1^2)/45"),
  (3, "L_3 = (62p_3 - 13p_2p_1 + 2p_1^3)/945"),
  (4, "L_4 = (381p_4 - 71p_3p_1 - 19p_2^2 + 22p_2p_1^2 - 3p_1^4)/14175")
]

def characteristicClassesDescription : List (Nat × String) := [
  (1, "w_1: orientation; w_1=0 iff orientable"),
  (2, "w_2: spin; w_2=0 iff spin"),
  (3, "p_1: related to signature; p_1[M^4] = 3*sigma"),
  (4, "p_2: (7p_2 - p_1^2)[M^8] = 45*sigma")
]

def importantManifoldsTable : List (String × Nat × String) := [
  ("S^n", 0, "Boundary of disk; [S^n] = 0"),
  ("RP^2", 2, "Generator of O_2^O = Z/2"),
  ("CP^2", 4, "Generator of O_4^SO = Z; signature = 1"),
  ("K3", 4, "Signature = -16; [K3] = -16[CP^2]"),
  ("Wu", 5, "Generator of Z/2 in O_5^SO"),
  ("HP^2", 8, "Generator of O_8^SO; signature = 1")
]

def fieldsMedalsRelated : List (Nat × String) := [
  (1958, "Thom (cobordism theory)"),
  (1962, "Milnor (exotic spheres)"),
  (1966, "Smale (h-cobordism, Poincare conj)"),
  (1966, "Atiyah (index theorem with Singer)"),
  (1978, "Quillen (algebraic K-theory, formal groups)"),
  (1986, "Freedman (4-dim Poincare conjecture)"),
  (1986, "Donaldson (exotic R^4)"),
  (1990, "Witten (TQFT, Jones polynomial)")
]

def openProblems : List String := [
  "Kervaire invariant 1 in dim 126?",
  "Novikov conjecture for all groups?",
  "Borel conjecture for all aspherical manifolds?",
  "Complete computation of pi_n^S for n > 100?",
  "Existence of exotic S^4? (smooth Poincare conjecture)"
]

def chromaticLayersDetail : List (Nat × String × String) := [
  (0, "Rational", "H_* tensor Q"),
  (1, "K-theory", "KU, KO, Im J"),
  (2, "Elliptic", "TMF, Tmf"),
  (3, "Morava E_3", "EO_3 at height 3")
]

#eval "== Comprehensive Cobordism Tables =="
#eval "Unoriented groups:"
#eval unorientedFullTable
#eval "Oriented groups:"
#eval orientedFullTable
#eval "Complex cobordism ranks:"
#eval complexCobordismRanks
#eval "Stable stems:"
#eval stableStemsTable
#eval "Exotic spheres:"
#eval exoticSpheresFullTable
#eval "L-genus polynomials:"
#eval lGenusTable
#eval "Characteristic classes:"
#eval characteristicClassesDescription
#eval "Important manifolds:"
#eval importantManifoldsTable
#eval "Fields Medals:"
#eval fieldsMedalsRelated
#eval "Open problems:"
#eval openProblems
#eval "Chromatic layers:"
#eval chromaticLayersDetail


end MiniCobordism
