import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def cobordismTimeline : List (Nat × String × String) := [
  (1954, "Thom", "Classification of unoriented cobordism; PT construction"),
  (1954, "Hirzebruch", "Signature theorem"),
  (1956, "Milnor", "Exotic 7-spheres discovered"),
  (1960, "Wall", "Classification of oriented cobordism"),
  (1960, "Milnor-Novikov", "Complex cobordism ring MU_*"),
  (1961, "Smale", "h-cobordism theorem; Poincare conj dim>=5"),
  (1962, "Novikov", "Symplectic cobordism MSp_*"),
  (1963, "Kervaire-Milnor", "Groups of homotopy spheres"),
  (1965, "Barden-Mazur-Stallings", "s-cobordism theorem"),
  (1969, "Quillen", "MU_* = Lazard ring (formal group laws)"),
  (1970, "Sullivan", "Surgery exact sequence"),
  (1976, "Landweber", "Exact functor theorem"),
  (1982, "Freedman", "TOP 4-dim Poincare conjecture"),
  (1983, "Donaldson", "Exotic smooth structures on R^4"),
  (1988, "Devinatz-Hopkins-Smith", "Nilpotence theorem"),
  (1994, "Seiberg-Witten", "Seiberg-Witten invariants"),
  (1998, "Hopkins-Smith", "Periodicity theorem; thick subcategories"),
  (2005, "Hopkins-Mahowald", "String cobordism and TMF"),
  (2009, "Lurie", "Cobordism hypothesis"),
  (2016, "Hill-Hopkins-Ravenel", "Kervaire invariant 1 problem")
]

def applicationsCobordism : List (String × String) := [
  ("TQFT", "Cobordism category; Atiyah-Segal axioms"),
  ("Chern-Simons", "3D TQFT; Witten; Jones polynomial"),
  ("Seiberg-Witten", "Smooth 4-manifold invariants"),
  ("Floer homology", "Cobordism maps between 3-manifolds"),
  ("String theory", "String cobordism -> TMF (Witten genus)"),
  ("K-theory", "Conner-Floyd: MU -> K"),
  ("Elliptic cohomology", "TMF from string cobordism"),
  ("Surgery theory", "Classification of manifolds"),
  ("Index theory", "Atiyah-Singer via cobordism invariance"),
  ("Knot theory", "Khovanov homology; link cobordism"),
  ("Homotopy theory", "Adams/ANSS spectral sequences")
]

def references : List String := [
  "Stong - Notes on Cobordism Theory (1968)",
  "Wall - Surgery on Compact Manifolds (1970, 1999)",
  "Milnor - Lectures on the h-Cobordism Theorem (1965)",
  "Ravenel - Complex Cobordism and Stable Homotopy (1986, 2004)",
  "Ravenel - Nilpotence and Periodicity (1992)",
  "Kochman - Bordism, Stable Homotopy and Adams SS (1996)",
  "Hirzebruch - Topological Methods in Algebraic Geometry (1956, 1978)",
  "Switzer - Algebraic Topology: Homotopy and Homology (1975)",
  "May - A Concise Course in Algebraic Topology (1999)"
]

def universityCourses : List (String × String) := [
  ("MIT 18.905", "Algebraic Topology II: Cobordism, h-cobordism"),
  ("Princeton MAT 560", "Differential Topology: PT, surgery"),
  ("Harvard Math 231", "Differential Topology: characteristic numbers"),
  ("Cambridge Part III", "Differential Topology: h-cobordism, exotic spheres"),
  ("Oxford Part C", "Algebraic Topology: Thom spectra, MU"),
  ("ENS Paris", "Topologie differentielle: cobordisme, chirurgie"),
  ("Tsinghua", "Differential Topology: cobordism, TMF, hypothesis")
]

#eval "== Cobordism History and Applications =="
#eval cobordismTimeline
#eval applicationsCobordism
#eval references
#eval universityCourses


end MiniCobordism
