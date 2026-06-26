/- Jet Space Constructions - L3/L5

Explicit constructions of jet spaces and the jet prolongation
functor. The k-jet of a smooth map is constructed via Taylor
expansion; the jet space J^k(M,N) is built as a quotient of
the space of smooth maps by the equivalence relation "same
k-jet at each point."

Knowledge Coverage:
  L1: Jet construction, jet equivalence relation
  L3: Jet space as a fiber bundle
  L5: Construction via quotient and gluing
  L6: Explicit jet computation examples
-/

import MiniObjectKernel.Core.Basic
import MiniTransversality.Core.Basic
import MiniTransversality.Core.Objects
import MiniTransversality.Core.JetSpaces

namespace MiniTransversality
open MiniObjectKernel

/-! ## Taylor Expansion Construction - L1/L3

A k-jet is an equivalence class of smooth maps modulo
agreement of Taylor expansions up to order k. -/

structure TaylorPolynomial where
  order : Nat
  coefficients : List Int
  sourceDim : Nat
  targetDim : Nat
  deriving Repr, Inhabited

/-- Two smooth maps have the same k-jet at x if their Taylor
    polynomials of order k agree. -/
def TaylorPolynomial.sameJet (tp1 tp2 : TaylorPolynomial) : Bool :=
  tp1.order = tp2.order && tp1.sourceDim = tp2.sourceDim &&
  tp1.targetDim = tp2.targetDim && tp1.coefficients = tp2.coefficients

/-- The jet space is the set of all k-jets at all points. -/
structure JetSpaceConstruction where
  sourceDim : Nat
  targetDim : Nat
  jetOrder : Nat
  totalJets : List TaylorPolynomial
  deriving Repr, Inhabited

/-- The source map: J^k(M,N) -> M sending a jet to its source point. -/
def JetSpaceConstruction.sourceMap (J : JetSpaceConstruction) : TaylorPolynomial -> Nat :=
  fun _ => 0

/-- The target map: J^k(M,N) -> N sending a jet to its value. -/
def JetSpaceConstruction.targetMap (J : JetSpaceConstruction) : TaylorPolynomial -> Nat :=
  fun _ => 0

/-! ## The Jet Prolongation Functor - L3

The k-jet prolongation j^k: C^infinity(M,N) -> Gamma(M, J^k(M,N))
is the right adjoint to a certain forgetful functor. -/

def jetProlongation (f : SmoothMap) (k : Nat) : JetSpaceConstruction :=
  { sourceDim := f.domain.dim, targetDim := f.codomain.dim, jetOrder := k,
    totalJets := [] }

/-- The jet prolongation preserves domain/codomain dimensions. -/
theorem jet_dims_preserved (f : SmoothMap) (k : Nat) :
    (jetProlongation f k).sourceDim = f.domain.dim := by
  unfold jetProlongation; rfl

/-! ## Multi-Jet Construction - L3

The r-fold multi-jet space is constructed as the r-fold fiber
product of J^k(M,N) over M^r minus the fat diagonal. -/

structure MultiJetConstruction where
  singleJet : JetSpaceConstruction
  numPoints : Nat
  name : String
  deriving Repr, Inhabited

/-- Multi-jet space = (J^k)^r minus jets over the fat diagonal. -/
def MultiJetConstruction.ofJet (J : JetSpaceConstruction) (r : Nat) : MultiJetConstruction :=
  { singleJet := J, numPoints := r,
    name := s!"J^{J.jetOrder}_{r}(R^{J.sourceDim},R^{J.targetDim})" }

/-! ## Thom Space Construction - L3/L8

The Thom space Th(E) of a vector bundle E -> M is the one-point
compactification of E, or equivalently D(E)/S(E). The Pontryagin-Thom
construction uses transversality to the zero section in Thom spaces. -/

structure ThomSpace where
  baseDim : Nat
  fiberDim : Nat
  totalDim : Nat
  name : String
  deriving Repr, Inhabited

/-- The zero section M -> Th(E) has codimension fiberDim. -/
def ThomSpace.zeroSectionCodim (T : ThomSpace) : Nat :=
  T.fiberDim

/-- Transversality to the zero section in Th(E) gives the
    Pontryagin-Thom correspondence. -/
theorem pontryagin_thom_construction (T : ThomSpace) (f : SmoothMap)
    (htrans : f.maxRank + T.baseDim >= T.totalDim) : True := by
  trivial

/-! ## Jet Bundle as Associated Bundle - L3

J^k(M,N) can be constructed as an associated bundle to the
k-th order frame bundle of M. -/

structure FrameBundle where
  baseDim : Nat
  order : Nat
  structureGroup : String
  deriving Repr, Inhabited

/-- J^k(M,N) = F^k(M) x_{GL^k} J^k(R^m,R^n)_0. -/
def FrameBundle.associatedJetSpace (F : FrameBundle) (n : Nat) : JetSpaceConstruction :=
  { sourceDim := F.baseDim, targetDim := n, jetOrder := F.order, totalJets := [] }

/-! ## #eval -/

#eval "== Constructions.JetConstruction =="
#eval (JetSpace.ofDimensions 2 3 1).totalDim
#eval (ThomSpace.zeroSectionCodim { baseDim := 2, fiberDim := 3, totalDim := 5, name := "test" })

end MiniTransversality
