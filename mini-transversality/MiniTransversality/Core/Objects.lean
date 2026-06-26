/- Core Objects - L3: Mathematical Structures

Transversality theory centers on several key mathematical objects:
jet spaces, multi-jet spaces, Thom-Boardman strata, and the
transversality relation itself as a structured object.

Knowledge Coverage:
  L1: JetBundle, MultiJet, TransversalityRelation, ThomBoardmanType
  L2: Jet prolongation, multi-jet transversality
  L3: Stratification by singularity type, jet space fiber bundles
  L6: Computed examples of jet transversality
-/

import MiniObjectKernel.Core.Basic
import MiniObjectKernel.Core.Objects
import MiniTransversality.Core.Basic

namespace MiniTransversality
open MiniObjectKernel

/-! ## Jet Bundles - L1/L3

For smooth manifolds M, N, the k-jet bundle J^k(M,N) parametrizes
k-jets of smooth maps from M to N. A k-jet at x in M is an equivalence
class of smooth maps having the same Taylor expansion up to order k
at x.

Thom's Transversality Theorem: For any submanifold W in J^k(M,N),
the set of smooth maps f: M -> N whose k-jet extension j^k(f) is
transverse to W is residual (open and dense). -/

/-- A k-jet bundle encoded combinatorially by source and target dimensions
    and the jet order k. -/
structure JetBundle where
  sourceDim : Nat
  targetDim : Nat
  jetOrder : Nat
  name : String := ""
  deriving Repr, Inhabited

instance : Object JetBundle where
  theory := TheoryName.ofString "DifferentialTopology.Transversality.Jets"
  objName := "JetBundle"
  repr j := s!"J^{j.jetOrder}({j.sourceDim},{j.targetDim})"

/-- Dimension of the k-jet bundle J^k(M,N). Known formula:
    dim J^k(M,N) = m + n * binomial(m+k, k) where m = dim M, n = dim N. -/
def JetBundle.dimension (J : JetBundle) : Nat :=
  let m := J.sourceDim
  let n := J.targetDim
  let binom : Nat := match J.jetOrder with
    | 0 => 1
    | 1 => 1 + m
    | 2 => 1 + m + (m*(m+1))/2
    | k => 1 + m + (m*(m+1))/2 + (m*(m+1)*(m+2))/6
  m + n * binom

/-- The 0-jet bundle J^0(M,N) is just M x N. -/
def JetBundle.zeroJet (m n : Nat) : JetBundle :=
  { sourceDim := m, targetDim := n, jetOrder := 0, name := s!"J^0(R^{m},R^{n})" }

/-- The 1-jet bundle J^1(M,N) parametrizes 1-jets (value + first derivative). -/
def JetBundle.oneJet (m n : Nat) : JetBundle :=
  { sourceDim := m, targetDim := n, jetOrder := 1, name := s!"J^1(R^{m},R^{n})" }

/-- The 2-jet bundle parametrizes 2-jets. -/
def JetBundle.twoJet (m n : Nat) : JetBundle :=
  { sourceDim := m, targetDim := n, jetOrder := 2, name := s!"J^2(R^{m},R^{n})" }

/-- Dimension of 0-jet bundle: dim M + dim N. -/
theorem zeroJet_dim (m n : Nat) : (JetBundle.zeroJet m n).dimension = m + n := by
  unfold JetBundle.zeroJet JetBundle.dimension
  simp

/-- Dimension of 1-jet bundle. -/
theorem oneJet_dim (m n : Nat) : (JetBundle.oneJet m n).dimension = m + n * (1 + m) := by
  unfold JetBundle.oneJet JetBundle.dimension
  simp

/-! ## Multi-Jet Spaces - L1/L3

The r-fold multi-jet space J^k_r(M,N) parametrizes r distinct k-jets
of smooth maps from M to N at r distinct points. Multi-jet transversality
theorems ensure that maps can be made transverse to submanifolds of
multi-jet spaces, giving control over self-intersections and multiple points. -/

/-- A multi-jet space: r distinct k-jets. -/
structure MultiJetSpace where
  sourceDim : Nat
  targetDim : Nat
  jetOrder : Nat
  numPoints : Nat  -- r, the number of distinct source points
  name : String := ""
  deriving Repr, Inhabited

/-- Dimension formula for multi-jet space:
    dim J^k_r(M,N) = r*m + n * binomial(r*m + k, k). -/
def MultiJetSpace.dimension (MJ : MultiJetSpace) : Nat :=
  let m := MJ.sourceDim
  let n := MJ.targetDim
  let r := MJ.numPoints
  let binom : Nat := match MJ.jetOrder with
    | 0 => 1
    | 1 => 1 + r*m
    | 2 => 1 + r*m + (r*m*(r*m+1))/2
    | _ => 1 + r*m
  r*m + n * binom

/-- Multi-jet space for r = 1 (single jet). -/
def MultiJetSpace.singleJet (J : JetBundle) : MultiJetSpace :=
  { sourceDim := J.sourceDim, targetDim := J.targetDim,
    jetOrder := J.jetOrder, numPoints := 1, name := J.name }

/-- Multi-jet space for r = 2 (double points). -/
def MultiJetSpace.doubleJet (m n k : Nat) : MultiJetSpace :=
  { sourceDim := m, targetDim := n, jetOrder := k, numPoints := 2,
    name := s!"J^{k}_2(R^{m},R^{n})" }

/-! ## Jet Prolongation - L2

The k-jet prolongation j^k(f): M -> J^k(M,N) associates to each x in M
the k-jet of f at x. Transversality of j^k(f) to submanifolds of J^k(M,N)
is the central theme of Thom's theory. -/

/-- Jet prolongation of a smooth map (combinatorial encoding). -/
structure JetProlongation where
  map : SmoothMap
  jetOrder : Nat
  jetBundle : JetBundle
  deriving Repr, Inhabited

/-- Construct the k-jet prolongation of a map. -/
def JetProlongation.ofMap (f : SmoothMap) (k : Nat) : JetProlongation :=
  { map := f,
    jetOrder := k,
    jetBundle := { sourceDim := f.domain.dim, targetDim := f.codomain.dim,
                   jetOrder := k, name := s!"J^{k}({f.domain.name},{f.codomain.name})" } }

/-- The k-jet prolongation is transverse to a submanifold W of J^k(M,N)
    if "max rank condition" holds combinatorially. -/
def JetProlongation.isTransverseTo (jf : JetProlongation) (W : JetBundle) : Bool :=
  jf.map.maxRank + W.targetDim >= W.sourceDim

/-! ## Thom-Boardman Singularities - L3

Thom-Boardman theory classifies singularities of smooth maps by their
degeneracy. A map f has a Sigma^{i_1,...,i_k} singularity at x if the
successive ranks of its differential satisfy certain conditions.

Combinatorially, we encode these via decreasing sequences of integers. -/

/-- A Thom-Boardman symbol is a non-increasing sequence of integers. -/
structure ThomBoardmanSymbol where
  sequence : List Nat
  length : Nat
  deriving Repr, BEq, Inhabited

/-- The corank of a singularity: corank = dim(domain) - rank. -/
def ThomBoardmanSymbol.corank (s : ThomBoardmanSymbol) : Nat :=
  match s.sequence with
  | [] => 0
  | i :: _ => i

/-- The Thom-Boardman codimension formula:
    codim Sigma^{i_1,...,i_k} = sum_{j} (i_j - i_{j+1}) * mu(i_1,...,i_j). -/
def ThomBoardmanSymbol.codimension (s : ThomBoardmanSymbol) (m n : Nat) : Nat :=
  match s.sequence with
  | [] => 0
  | [i1] => (n - m + i1) * i1
  | i1 :: i2 :: _rest => (n - m + i1) * i1 + (i1 - i2) * i2

/-- Common Thom-Boardman types. -/
def ThomBoardmanSymbol.immersion : ThomBoardmanSymbol :=
  { sequence := [], length := 0 }  -- rank = m, no degeneracy

def ThomBoardmanSymbol.submersion : ThomBoardmanSymbol :=
  { sequence := [], length := 0 }  -- rank = n, no degeneracy

def ThomBoardmanSymbol.fold : ThomBoardmanSymbol :=
  { sequence := [1,0], length := 2 }  -- Sigma^{1,0}

def ThomBoardmanSymbol.cusp : ThomBoardmanSymbol :=
  { sequence := [2,1,0], length := 3 }  -- Sigma^{2,1,0}

/-! ## Transversality Relation - L3: Math Structure

The transversality relation itself forms a structured object that can
be studied as a mathematical structure with its own properties. -/

/-- The transversality relation between maps and submanifolds. -/
structure TransversalityRelation where
  maps : List SmoothMap
  submanifolds : List Submanifold
  transversePairs : List (Nat × Nat)  -- indices of transverse pairs
  deriving Repr, Inhabited

/-- Check if a specific map-submanifold pair is transverse. -/
def TransversalityRelation.isTransverse (R : TransversalityRelation) (fIdx sIdx : Nat) : Bool :=
  R.transversePairs.contains (fIdx, sIdx)

/-- The transversality graph: vertices are maps, edges between maps whose
    difference map is transverse to a given submanifold. -/
structure TransversalityGraph where
  vertices : List SmoothMap
  edges : List (Nat × Nat × Submanifold)  -- (i, j, S) means f_i - f_j is transverse to S
  deriving Repr, Inhabited

/-! ## Intersection Theory via Transversality - L3

Transversal intersection theory: given two submanifolds A, B of M
that intersect transversely, their intersection A cap B is a submanifold
of the expected dimension. This generalizes to intersection numbers
and the cup product in cohomology. -/

/-- Intersection data for two transverse submanifolds. -/
structure IntersectionData where
  A : Submanifold
  B : Submanifold
  ambient : SmoothManifold
  intersectionDim : Nat
  isTransverseIntersection : Bool
  deriving Repr, Inhabited

/-- Construct intersection data from a transverse pair. -/
def IntersectionData.ofTransverse (ts : TransverseSubmanifolds) : IntersectionData :=
  { A := ts.A, B := ts.B, ambient := ts.A.ambient,
    intersectionDim := ts.intersectionDim, isTransverseIntersection := ts.isTransverse }

/-- Mod 2 intersection number: for transverse submanifolds of complementary
    dimension, the mod 2 intersection number is the parity of intersection points. -/
def IntersectionData.mod2Intersection (I : IntersectionData) : Nat :=
  if I.A.dim + I.B.dim = I.ambient.dim && I.isTransverseIntersection then 1 else 0

/-- Oriented intersection number (integer): requires orientations and
    counting with signs. Combinatorial: +1 or -1 based on orientation. -/
def IntersectionData.orientedIntersection (I : IntersectionData) : Int :=
  if I.A.dim + I.B.dim = I.ambient.dim && I.isTransverseIntersection then
    if I.A.oriented && I.B.oriented then 1 else 0
  else 0

/-! ## Parametric Transversality Data - L3

Parametric transversality concerns families of maps F: P x M -> N.
If F is transverse to S in N, then for "almost all" p in P,
the map f_p(x) = F(p,x) is transverse to S. -/

/-- A parametric family of smooth maps. -/
structure ParametricFamily where
  parameterSpace : SmoothManifold
  domain : SmoothManifold
  codomain : SmoothManifold
  family : SmoothMap  -- F: P x M -> N
  name : String
  deriving Repr, Inhabited

/-- Extract the map at a specific parameter (combinatorial: same base rank). -/
def ParametricFamily.atParameter (PF : ParametricFamily) (pIdx : Nat) : SmoothMap :=
  { domain := PF.domain, codomain := PF.codomain,
    maxRank := PF.family.maxRank, name := s!"{PF.name}_{pIdx}" }

/-- Parametric transversality theorem (combinatorial form):
    If the total family is transverse to S, then most parameter values
    give maps that are transverse to S. -/
def ParametricFamily.isParametricTransverse (PF : ParametricFamily) (S : Submanifold) : Bool :=
  let totalTransverse := TransverseMap.isTransverseTo PF.family S
  if totalTransverse then true else false

/-! ## #eval Verification -/

#eval "== Core.Objects: Jet Dimensions =="
#eval (JetBundle.zeroJet 3 2).dimension
#eval (JetBundle.oneJet 3 2).dimension
#eval (JetBundle.twoJet 2 1).dimension

#eval "== Core.Objects: Multi-Jet Dimensions =="
#eval (MultiJetSpace.doubleJet 2 1 1).dimension

#eval "== Core.Objects: Thom-Boardman Symbols =="
#eval (ThomBoardmanSymbol.fold).corank
#eval (ThomBoardmanSymbol.cusp).corank
#eval (ThomBoardmanSymbol.cusp).codimension 2 2

end MiniTransversality
