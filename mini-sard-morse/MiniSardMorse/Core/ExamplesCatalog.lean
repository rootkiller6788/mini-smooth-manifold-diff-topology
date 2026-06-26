/- Examples Catalog -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def examples_catalog : List (String × String) := [
  ("Height on S^n", "Morse function with exactly 2 critical points: min and max"),
  ("Height on T^2", "Standard height function on torus: 4 critical points (min, 2 saddle, max)"),
  ("Height on RP^2", "Height on real projective plane: 3 critical points"),
  ("Distance squared", "f(x) = |x-p|^2 has a unique minimum at p"),
  ("Moment map on CP^n", "Morse-Bott function with critical manifold CP^0 = pt"),
  ("Energy on loop space", "E(gamma) = int |gamma|^2 dt, critical points are geodesics"),
  ("Chern-Simons functional", "On 3-manifolds, critical points are flat connections"),
  ("Symplectic action", "On loop space of symplectic manifold, critical points = periodic orbits"),
  ("Yang-Mills functional", "On 4-manifolds, critical points are instantons"),
  ("Hilbert-Einstein action", "Critical points are Einstein metrics"),
  ("Willmore energy", "On surfaces in R^3, critical points are Willmore surfaces"),
  ("Ginzburg-Landau energy", "Morse-Bott function on vortex moduli space"),
  ("Seiberg-Witten functional", "Critical points are monopoles on 4-manifolds"),
  ("Calabi functional", "On Kahler metrics, critical points are extremal metrics"),
  ("Dirichlet energy", "On maps between manifolds, critical points are harmonic maps"),
]

#eval "== ExamplesCatalog =="
#eval examples_catalog

end MiniSardMorse