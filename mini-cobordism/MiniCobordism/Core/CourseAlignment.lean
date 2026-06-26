import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def universityCourseMapping : List (String × String × List String) := [
  ("MIT", "18.905 Algebraic Topology II", ["Cobordism", "Pontryagin-Thom", "Thom theorem", "h-cobordism"]),
  ("Princeton", "MAT 560 Differential Topology", ["Pontryagin-Thom", "Surgery theory", "Exotic spheres"]),
  ("Harvard", "Math 231 Differential Topology", ["Characteristic numbers", "Thom spectra"]),
  ("Cambridge", "Part III Differential Topology", ["h-cobordism", "s-cobordism", "Exotic spheres"]),
  ("Oxford", "Part C Algebraic Topology", ["Thom spectra", "Complex cobordism", "Chromatic"]),
  ("ENS Paris", "Topologie differentielle", ["Cobordisme", "Theoreme de Thom", "h-cobordisme"]),
  ("ETH Zurich", "401-3462 Differential Topology", ["Cobordism", "Surgery", "Novikov conjecture"]),
  ("Tsinghua", "Differential Topology", ["Cobordism", "TMF", "Cobordism hypothesis"]),
  ("Stanford", "MATH 215C Differential Topology", ["Cobordism", "Transversality"]),
  ("Berkeley", "Math 214 Differential Topology", ["Sard theorem", "Cobordism groups", "Surgery"])
]

def courseChapters : List (Nat × String × String) := [
  (1, "Smooth manifolds", "Definition, tangent bundle, embeddings"),
  (2, "Transversality", "Sard theorem, Thom transversality"),
  (3, "Cobordism", "Cobordism equivalence, groups, Pontryagin-Thom"),
  (4, "Characteristic numbers", "Stiefel-Whitney, Pontryagin, Chern"),
  (5, "Thom theorem", "Classification of unoriented cobordism"),
  (6, "h-cobordism", "Smale theorem, proof via handle theory"),
  (7, "Exotic spheres", "Milnor 7-spheres, Kervaire-Milnor"),
  (8, "Surgery theory", "Wall surgery exact sequence"),
  (9, "Spectra", "Thom spectra MO, MSO, MU"),
  (10, "Applications", "TQFT, index theory, chromatic homotopy")
]

def learningObjectives : List String := [
  "Define cobordism and prove it is an equivalence relation",
  "Compute O_0^O, O_1^O, O_2^O",
  "State and apply Pontryagin-Thom isomorphism",
  "Compute Stiefel-Whitney numbers for RP^n",
  "State Thom theorem on unoriented cobordism ring",
  "Explain h-cobordism theorem and its proof strategy",
  "Describe Milnor construction of exotic 7-spheres",
  "State the surgery exact sequence",
  "Explain the role of MU in chromatic homotopy theory",
  "Describe the cobordism hypothesis"
]

#eval "== Course Alignment =="
#eval universityCourseMapping
#eval courseChapters
#eval learningObjectives


end MiniCobordism
