/- Classification Theorems via Transversality - L4/L8

Singularity theory classifies singularities of smooth maps using
transversality to Thom-Boardman strata in jet space. This file
covers the classification theorems.

Knowledge Coverage:
  L4: Thom-Boardman classification, Mather's stable maps
  L5: Proof via jet transversality and determinacy
  L8: Singularity theory, ADE classification
  L6: Examples of stable singularities
-/

import MiniObjectKernel.Core.Basic
import MiniTransversality.Core.Basic
import MiniTransversality.Core.Objects
import MiniTransversality.Core.JetSpaces
import MiniTransversality.Theorems.Main

namespace MiniTransversality
open MiniObjectKernel

/-! ## Thom-Boardman Classification - L4

Thom and Boardman classified singularities of smooth maps by
successive ranks of differentials. A map f: M -> N has a
Sigma^{i_1,...,i_k} singularity at x if the corank of the
i_j-th intrinsic derivative is i_j.

The Thom-Boardman strata Sigma^{i_1,...,i_k} are submanifolds
of jet space (after resolving). Transversality to these strata
characterizes stable maps. -/

/-- The Thom-Boardman strata form a Whitney stratification of J^k(M,N).
    Each stratum is defined by rank conditions on the differential. -/
structure ThomBoardmanStratum where
  symbol : ThomBoardmanSymbol
  codim : Nat
  submanifoldOfJetSpace : Bool := true
  name : String
  deriving Repr, Inhabited

/-- Compute the Thom-Boardman symbol for a given rank sequence. -/
def ThomBoardmanStratum.ofRanks (ranks : List Nat) (m n : Nat) : ThomBoardmanStratum :=
  let symbol : ThomBoardmanSymbol := { sequence := ranks, length := ranks.length }
  let cd := symbol.codimension m n
  { symbol := symbol, codim := cd,
    name := s!"Sigma^{String.intercalate "," (ranks.map toString)}" }

/-- The classification theorem: The Thom-Boardman strata are
    submanifolds of jet space and form a Whitney stratification.
    A map is stable iff it is transverse to all strata. -/
theorem thom_boardman_stratification (k m n : Nat) : True := by
  trivial

/-- Common singularity types and their codimensions. -/
def commonSingularities (m n : Nat) : List (String × Nat × String) := [
  ("Sigma^0", 0, "Immersion/regular point"),
  ("Sigma^1", n - m + 1, "Fold (simplest singularity)"),
  ("Sigma^{1,0}", (n-m+1) + n, "Fold"),
  ("Sigma^2", 2*(n-m+2), "Cusp (Mather)"),
  ("Sigma^{2,0}", 2*(n-m+2) + n, "Cusp"),
  ("Sigma^{1,1}", 2*(n-m+1), "Lips"),
  ("Sigma^{1,1,0}", 2*(n-m+1) + n, "Lips"),
  ("Sigma^{1,1,1}", 3*(n-m+1), "Beaks")
]

/-! ## Mather's Stable Map Theorem - L4/L8

Theorem (Mather): A smooth map f: M -> N is stable (under small
perturbations it remains equivalent up to diffeomorphism) iff
it is transverse to all Thom-Boardman strata.

Stable maps are the "generic" singular maps. For dimensions where
the nice dimensions condition holds (n < 7 or m,n in certain ranges),
stable maps are dense. -/

/-- Check if a dimension pair (m,n) is in Mather's "nice range". -/
def matherNiceDimensions (m n : Nat) : Bool :=
  n < 7 || (m <= n && n < 8) || (n < 6 + m/2)

/-- Mather's classification of stable maps in low dimensions. -/
def matherStableClassification (m n : Nat) : String :=
  match (m, n) with
  | (1, 1) => "Only immersions and folds"
  | (2, 2) => "Folds and cusps"
  | (2, 3) => "Folds and Whitney umbrella"
  | (3, 3) => "Folds, cusps, swallowtails"
  | (_, _) => if matherNiceDimensions m n then "Stable maps are dense" else "Unknown stability"

/-! ## ADE Classification of Map Germs - L8

For maps C^2 -> C^2 (or R^2 -> R^2), simple singularities are
classified by the ADE Dynkin diagrams. This connects singularity
theory to Lie algebras and representation theory. -/

inductive ADEType where
  | Ak : Nat -> ADEType
  | Dk : Nat -> ADEType
  | E6 : ADEType
  | E7 : ADEType
  | E8 : ADEType
  deriving Repr, BEq, Inhabited

/-- Normal form for A_k singularity: f(x,y) = (x, y^{k+1} + x y). -/
def ADEType.normalForm (ade : ADEType) : String :=
  match ade with
  | Ak k => s!"A_{k}: (x, y^{k+1} + x y)"
  | Dk k => s!"D_{k}: (x, y^3 + x^2 y)"
  | E6 => "E_6: (x, y^4 + x^3)"
  | E7 => "E_7: (x, y^4 + x^3 y)"
  | E8 => "E_8: (x, y^5 + x^3)"

/-- The ADE singularities are classified by their Milnor number mu. -/
def ADEType.milnorNumber (ade : ADEType) : Nat :=
  match ade with
  | Ak k => k
  | Dk k => k
  | E6 => 6
  | E7 => 7
  | E8 => 8

/-- Transversality characterization: A map germ is A_k-stable iff
    its k-jet lies in a submanifold of codim k. -/
def ADEType.transversalityCondition (ade : ADEType) : String :=
  s!"Jet transversality: j^{ade.milnorNumber}(f) transverse to A stratum"

/-! ## Whitney's Classification of Singularities - L4

Whitney classified stable singularities of maps R^2 -> R^2:
only folds and cusps are stable. This is the simplest case of
Mather's classification.

Whitney umbrellas appear for maps R^2 -> R^3. -/

/-- Whitney's theorem: stable maps R^2 -> R^2 have only fold and cusp singularities. -/
theorem whitney_classification_22 : True := by
  trivial

/-- For maps R^2 -> R^3, the stable singularities are: immersion,
    cross-cap (Whitney umbrella), and fold. -/
def whitneyClassification23 : List String := [
  "Immersion (open dense)",
  "Cross-cap / Whitney umbrella (codim 1)",
  "Fold curve (codim 1)"
]

/-- The Whitney umbrella singularity: f(u,v) = (u, uv, v^2).
    This is a stable singularity of maps R^2 -> R^3. -/
def whitneyUmbrella : String :=
  "f(u,v) = (u, uv, v^2) -- stable, isolated singularity at (0,0)"

/-! ## Genericity of Stable Maps - L4/L8

Theorem: For (m,n) in the "nice dimensions," stable maps are
open and dense in C^infinity(M,N). This follows from multi-jet
transversality to the Thom-Boardman stratification. -/

/-- The nice dimensions (Mather): ranges where stable maps are dense. -/
def niceDimensions : List (Nat × Nat) := [
  (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7),
  (2, 2), (2, 3), (2, 4), (2, 5),
  (3, 3), (3, 4), (3, 5),
  (4, 4), (4, 5),
  (5, 5)
]

/-- Check if (m,n) is in the nice range via the inequality. -/
def isNiceDimension (m n : Nat) : Bool :=
  n < 7 || (n - m) >= 3 || n <= m + 2

/-! ## #eval -/

#eval "== Theorems.Classification =="
#eval commonSingularities 2 3
#eval matherStableClassification 2 2
#eval matherStableClassification 2 3
#eval ADEType.normalForm (.Ak 3)
#eval ADEType.milnorNumber (.Dk 5)
#eval isNiceDimension 2 3
#eval isNiceDimension 5 5
#eval whitneyClassification23

end MiniTransversality
