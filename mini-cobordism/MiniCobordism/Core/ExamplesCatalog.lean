import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def standardExamples : List (String × String) := [
  ("S^n", "All spheres bound: S^n = dD^{n+1} => [S^n] = 0"),
  ("RP^2", "w_1^2[RP^2]=1 => [RP^2] generates O_2^O = Z/2"),
  ("RP^3", "Oriented, but all SW numbers vanish => [RP^3] = 0"),
  ("RP^4", "Not a boundary in O_4^O = (Z/2)^2"),
  ("CP^2", "sigma=1 => [CP^2] generates O_4^SO = Z"),
  ("CP^4", "sigma=1 => [CP^4] generates one Z in O_8^SO"),
  ("HP^2", "sigma=1 => [HP^2] generates other Z in O_8^SO"),
  ("K3 surface", "sigma=-16 => [K3] = -16[CP^2] in O_4^SO"),
  ("Wu manifold", "SU(3)/SO(3) generates Z/2 in O_5^SO"),
  ("Exotic S^7", "28 classes, bP_8 = Z/28, all bound parallelizable"),
  ("T^2 (torus)", "Bounds S^1 x D^2 => [T^2] = 0"),
  ("S^1 x S^1", "Same as T^2 => bounds")
]

def computationalExamples : List (String × String) := [
  ("O_0^O", "Z/2 (point)"),
  ("O_1^O", "0 (S^1 bounds)"),
  ("O_2^O", "Z/2 (RP^2)"),
  ("O_3^O", "0"),
  ("O_4^O", "(Z/2)^2 (RP^4, RP^2 x RP^2)"),
  ("O_0^SO", "Z (point, signature)"),
  ("O_1^SO", "0"),
  ("O_2^SO", "0"),
  ("O_3^SO", "0"),
  ("O_4^SO", "Z (CP^2, signature = 1)"),
  ("O_5^SO", "Z/2 (Wu manifold)"),
  ("O_6^SO", "0"),
  ("O_7^SO", "0"),
  ("O_8^SO", "Z + Z (CP^4, HP^2)")
]

#eval "== Examples Catalog =="
#eval standardExamples
#eval computationalExamples


end MiniCobordism
