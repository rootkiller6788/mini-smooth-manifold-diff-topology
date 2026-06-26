import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def primaryPapers : List (String × String × Nat) := [
  ("Thom", "Quelques proprietes globales des varietes differentiables", 1954),
  ("Hirzebruch", "Neue topologische Methoden in der algebraischen Geometrie", 1956),
  ("Milnor", "On manifolds homeomorphic to the 7-sphere", 1956),
  ("Smale", "Generalized Poincare conjecture in dimensions > 4", 1961),
  ("Wall", "Determination of the cobordism ring", 1960),
  ("Milnor-Novikov", "Complex cobordism ring", 1960),
  ("Kervaire-Milnor", "Groups of homotopy spheres I", 1963),
  ("Barden-Mazur-Stallings", "s-cobordism theorem", 1965),
  ("Quillen", "On formal group laws of cobordism theory", 1969),
  ("Sullivan", "Geometric topology", 1970),
  ("Devinatz-Hopkins-Smith", "Nilpotence I, II", 1988),
  ("Hopkins-Smith", "Nilpotence and stable homotopy II", 1998),
  ("Hill-Hopkins-Ravenel", "Nonexistence of Kervaire invariant 1", 2016),
  ("Lurie", "On the classification of TQFTs", 2009)
]

def textbooks : List (String × String) := [
  ("Stong", "Notes on Cobordism Theory (1968)"),
  ("Wall", "Surgery on Compact Manifolds (1970, 2nd ed 1999)"),
  ("Milnor", "Lectures on the h-Cobordism Theorem (1965)"),
  ("Ravenel", "Complex Cobordism and Stable Homotopy (1986, 2nd ed 2004)"),
  ("Ravenel", "Nilpotence and Periodicity in Stable Homotopy (1992)"),
  ("Kochman", "Bordism, Stable Homotopy and Adams SS (1996)"),
  ("Hirzebruch", "Topological Methods in Algebraic Geometry (1956)"),
  ("Switzer", "Algebraic Topology: Homotopy and Homology (1975)"),
  ("May", "A Concise Course in Algebraic Topology (1999)"),
  ("Adams", "Stable Homotopy and Generalised Homology (1974)"),
  ("Hatcher", "Algebraic Topology (2002)"),
  ("Milnor-Stasheff", "Characteristic Classes (1974)"),
  ("Hirsch", "Differential Topology (1976)"),
  ("Guillemin-Pollack", "Differential Topology (1974)")
]

def keyConcepts : List (String × String) := [
  ("Cobordism", "Equivalence relation: M ~ N if M U N bounds W"),
  ("Thom spectrum", "MO = {MO(k)}, representing spectrum for bordism"),
  ("Characteristic number", "SW, Pontryagin, Chern numbers detect bordism"),
  ("h-cobordism", "Cobordism that is homotopy equivalence on both ends"),
  ("Surgery", "Remove S^k x D^{n-k}, glue D^{k+1} x S^{n-k-1}"),
  ("Whitney trick", "Cancel intersection points in dim >= 5"),
  ("Whitehead torsion", "tau(W,M) in Wh(pi_1M)"),
  ("Chromatic filtration", "L_0 < L_1 < L_2 < ... < Sp"),
  ("Formal group law", "Universal FGL over MU_* (Quillen)"),
  ("Cobordism hypothesis", "Bord_n^fr free on point (Lurie)")
]

#eval "== Bibliography =="
#eval primaryPapers
#eval textbooks
#eval keyConcepts


end MiniCobordism
