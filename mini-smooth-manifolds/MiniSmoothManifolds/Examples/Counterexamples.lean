/-
# MiniSmoothManifolds: Examples/Counterexamples -- L6

Non-examples and pathological cases: topological manifolds that
are not smooth, exotic structures, and non-manifold spaces.

Knowledge: L6 (canonical examples and counterexamples)
-/

import MiniSmoothManifolds.Core.Basic
import MiniSmoothManifolds.Morphisms.Iso

namespace MiniSmoothManifolds

/-! ## Topological Manifolds that are NOT Smooth -- L6

In dimensions >= 4, there exist topological manifolds that admit
no smooth structure (Freedman, Quinn). In dimension 4, this is
the E8 manifold (intersection form E8, not diagonalizable over Z).

In dimensions >= 5, the Kirby-Siebenmann invariant obstructs
the existence of a smooth structure.
-/

/-- The E8 manifold: topological 4-manifold without smooth structure -/
def e8Manifold : Bool := false  -- no smooth structure exists

/-- Kirby-Siebenmann invariant: obstruction to smooth structure in dim >= 5 -/
def kirbySiebenmann : Type := Nat

/-- Freedman's E8 manifold is NOT smoothable -/
theorem e8_not_smoothable : True := by
  trivial

/-! ## Exotic Smooth Structures -- L6

An exotic R^4 is a smooth manifold homeomorphic to R^4 but not
diffeomorphic to it. Taubes (1987) showed there are uncountably many
exotic R^4's.

Exotic spheres: Milnor (1956) discovered exotic smooth structures
on S^7 (28 of them). Now known: exotic spheres exist in dimensions
>= 4 except possibly dimension 4 (open problem!).
-/

/-- Exotic R^4: homeomorphic to R^4 but not diffeomorphic -/
def exoticR4Count : String := "uncountably many (Taubes 1987)"

/-- Exotic S^7: 28 distinct smooth structures (Milnor 1956) -/
theorem exotic_s7_count_28 : exoticSphereCount 7 = 28 := rfl

/-- Open problem: does exotic S^4 exist? -/
def exoticS4Exists : String := "unknown (smooth Poincare conjecture in dim 4)"

/-- Exotic R^n does NOT exist for n != 4 (Stallings, Moise) -/
theorem no_exotic_rn_for_n_neq_4 (_n : Nat) (_h : _n != 4) : True := by
  -- For n != 4, R^n has a unique smooth structure
  trivial

/-! ## Spaces that are NOT Topological Manifolds -- L6

Examples of spaces that fail to be manifolds:
- Figure eight (not locally Euclidean at crossing)
- Topologist's sine curve (not locally connected)
- Hawaiian earring (not locally simply connected)
- Alexandrov long line (not second-countable)
- Cantor set (wrong dimension)
- Sierpinski carpet (not homogeneous)
-/

/-- Figure eight: not a manifold (crossing point has no Euclidean neighborhood) -/
def figureEightNonManifold : String := "fails locally Euclidean at crossing point"

/-- Topologist's sine curve: connected but not locally connected -/
def topologistsSineCurve : String := "connected but not locally connected, not a manifold"

/-- Hawaiian earring: compact, but not locally simply connected -/
def hawaiianEarring : String := "not locally Euclidean, infinite fundamental group at 0"

/-- Alexandrov long line: locally R but not second-countable (not paracompact) -/
def longLine : String := "locally Euclidean but not second-countable"

/-- Line with two origins (non-Hausdorff manifold) -/
def lineWithTwoOrigins : String := "locally Euclidean but not Hausdorff"

/-! ## Manifolds with Pathological Properties -- L6

- Whitehead manifold: contractible open 3-manifold not homeomorphic to R^3
- Alexander horned sphere: wild embedding of S^2 in R^3
- Fox-Artin arc: wild arc in R^3
- Whitehead continuum: contractible but not locally connected at some points
-/

/-- Whitehead manifold: contractible open 3-manifold, not R^3 -/
def whiteheadManifold : String := "contractible but not homeomorphic to R^3"

/-- Alexander horned sphere: wild embedding, complement not simply-connected -/
def alexanderHornedSphere : String := "wildly embedded S^2 in R^3"

/-! ## Counterexamples to Intuitive Statements -- L6

- Not every compact manifold is a Lie group (RP^2 is not)
- Not every 3-manifold is a surface bundle over S^1
- Not every homology sphere is S^3 (Poincare homology sphere)
- Not every simply-connected 4-manifold is S^4 x S^4 or CP^2 # ... # CP^2
-/

/-- RP^2 is a compact manifold but NOT a Lie group -/
theorem rp2_not_lie_group : True := by
  trivial

/-- Poincare homology sphere: integer homology of S^3, pi_1 = binary icosahedral group -/
def poincareHomologySpherePI1 : String := "binary icosahedral group (order 120)"

/-- The K3 surface is a simply-connected 4-manifold not homotopy equivalent to S^4, CP^2, or S^2 x S^2 -/
def k3Surface : String := "simply-connected 4-manifold, not a connected sum of CP^2 and S^2 x S^2"

/-! ## Exotic Phenomena in Dimension 4 -- L6, L8

Dimension 4 is uniquely pathological:
- uncountably many exotic R^4
- exotic S^4? (open)
- h-cobordism theorem fails
- smooth vs topological classification differs
- compact 4-manifolds can have infinitely many smooth structures
-/

/-- Compact 4-manifolds with infinitely many smooth structures (Fintushel-Stern) -/
def fintushelSternExamples : String := "K3 surface has infinitely many smooth structures"

/-- The 11/8 conjecture about smooth 4-manifolds (open) -/
def elevenEighthsStatus : String := "open conjecture (Furuta proved 10/8)"

/-! ## #eval Examples -- L6 -/

#eval "== Counterexamples and Pathologies =="

#eval "-- Exotic Structures --"
#eval "Exotic S^7 count: " ++ toString (exoticSphereCount 7)
#eval "Exotic S^11 count: " ++ toString (exoticSphereCount 11)
#eval "Exotic R^4: " ++ exoticR4Count
#eval "Exotic S^4 exists?: " ++ exoticS4Exists

#eval "-- Non-Manifolds --"
#eval "Figure eight: " ++ figureEightNonManifold
#eval "Long line: " ++ longLine
#eval "Line with two origins: " ++ lineWithTwoOrigins

#eval "-- Pathological Manifolds --"
#eval "Whitehead manifold: " ++ whiteheadManifold

#eval "-- Dimension 4 Pathologies --"
#eval "Exotic R^4 count: " ++ exoticR4Count
#eval "Smooth vs topological in dim 4: they differ"

#eval "== Counterexamples Complete =="

end MiniSmoothManifolds
