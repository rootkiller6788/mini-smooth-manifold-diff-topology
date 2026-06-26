import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def framedCobordismExtended : List (Nat × String) := [
  (0, "Z"), (1, "Z/2 (eta)"), (2, "Z/2 (eta^2)"), (3, "Z/24 (nu)"),
  (4, "0"), (5, "0"), (6, "Z/2 (nu^2)"), (7, "Z/240 (sigma)"),
  (8, "(Z/2)^2 (epsilon, eta*sigma)"), (9, "(Z/2)^3 (eta*epsilon, mu, eta^2*sigma)"),
  (10, "Z/6"), (11, "Z/504 (zeta)"), (12, "0"), (13, "Z/3"),
  (14, "(Z/2)^2 (sigma^2, kappa)"), (15, "Z/480 + Z/2 (rho, eta*kappa)"),
  (16, "(Z/2)^2 (eta*rho, eta^2*kappa)"), (17, "(Z/2)^4"),
  (18, "Z/8 + Z/2"), (19, "Z/264 + (Z/2)^2"),
  (20, "Z/24 (kappa-bar)"), (21, "(Z/2)^2"), (22, "(Z/2)^4"),
  (23, "Z/2 + (Z/2)^4"), (24, "Z/2 + (Z/2)^2")
]

def thetaGroupExtended : List (Nat × Nat) := [
  (5, 1), (6, 1), (7, 28), (8, 2), (9, 8), (10, 6), (11, 992),
  (12, 1), (13, 3), (14, 2), (15, 16256), (16, 2), (17, 16),
  (18, 16), (19, 523264), (20, 24), (21, 2), (22, 1),
  (23, 32), (24, 1), (25, 1)
]

def handleTheoryTable : List (Nat × String × String) := [
  (0, "D^0 x D^n", "minimum of Morse function"),
  (1, "D^1 x D^{n-1}", "attached along S^0 x D^{n-1}"),
  (2, "D^2 x D^{n-2}", "attached along S^1 x D^{n-2}"),
  (3, "D^3 x D^{n-3}", "attached along S^2 x D^{n-3}"),
  (4, "D^4 x D^{n-4}", "attached along S^3 x D^{n-4}"),
  (5, "D^5 x D^{n-5}", "attached along S^4 x D^{n-5}")
]

def surgeryTheoryTable : List (String × String) := [
  ("S(M)", "Structure set: DIFF structures on M / diffeomorphism"),
  ("N(M)", "Normal invariants: [M, G/O]"),
  ("L_n(pi_1)", "Surgery obstruction: Wall L-groups"),
  ("G/O", "Fiber of BO -> BG; classifies stable bundle reductions"),
  ("bP_{n+1}", "Homotopy spheres bounding parallelizable manifolds"),
  ("Coker J_n", "Cokernel of J: pi_n(SO) -> pi_n^S")
]

def surfaceCobordismTable : List (String × Int × Int × String) := [
  ("S^2", 2, 0, "Trivial in all cobordism"),
  ("T^2", 0, 0, "Boundary of S^1 x D^2"),
  ("RP^2", 1, 0, "Generator of O_2^O = Z/2"),
  ("Klein", 0, 0, "Cobordant to RP^2 + RP^2"),
  ("S_g", 2-2, 0, "Trivial in oriented (bounds handlebody)")
]

def manifoldsDimensionsTable : List (String × Nat × Int × Int) := [
  ("S^1", 1, 0, 0), ("S^2", 2, 2, 0), ("S^3", 3, 0, 0),
  ("S^4", 4, 2, 0), ("S^5", 5, 0, 0), ("S^6", 6, 2, 0),
  ("RP^2", 2, 1, 0), ("RP^3", 3, 0, 0), ("RP^4", 4, 1, 0),
  ("CP^1", 2, 2, 0), ("CP^2", 4, 3, 1), ("CP^3", 6, 4, 0),
  ("HP^2", 8, 3, 1), ("K3", 4, 24, -16)
]

def principalBundlesTable : List (String × String) := [
  ("O(k)", "Orthogonal group: real vector bundles"),
  ("SO(k)", "Special orthogonal: oriented vector bundles"),
  ("U(k)", "Unitary group: complex vector bundles"),
  ("SU(k)", "Special unitary: Calabi-Yau structures"),
  ("Sp(k)", "Symplectic group: quaternionic vector bundles"),
  ("Spin(k)", "Spin group: spin structures"),
  ("String(k)", "String group: string structures")
]

#eval "== Extended Tables =="
#eval "Framed cobordism extended:"
#eval framedCobordismExtended
#eval "Theta groups:"
#eval thetaGroupExtended
#eval "Handle theory:"
#eval handleTheoryTable
#eval "Surgery theory:"
#eval surgeryTheoryTable
#eval "Surface cobordism:"
#eval surfaceCobordismTable
#eval "Manifold dimensions:"
#eval manifoldsDimensionsTable
#eval "Principal bundles:"
#eval principalBundlesTable


end MiniCobordism
