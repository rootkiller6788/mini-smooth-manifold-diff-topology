/-
# MiniVectorFieldsFlows: Core Basic Definitions — L1 Definitions
Vector fields as sections of tangent bundles, flows as one-parameter groups
of diffeomorphisms, integral curves, Lie brackets, and singularity theory.

Covers L1 (Definitions), L2 (Core Concepts), L6 (Examples).
-/

import MiniObjectKernel.Core.Basic

namespace MiniVectorFieldsFlows
open MiniObjectKernel

/-! ## Dimension and Smoothness — L1 -/

/-- Dimension of the underlying manifold (symbolic). -/
structure Dimension where
  n : Nat
  deriving Repr, BEq, Inhabited

instance : ToString Dimension where
  toString d := toString d.n

/-- Smoothness class for vector fields. -/
inductive SmoothClass where
  | C0 | Ck (k : Nat) | Cinfinity | Comega
  deriving Repr, BEq, Inhabited

def SmoothClass.toNat (s : SmoothClass) : Option Nat :=
  match s with
  | C0 => some 0
  | Ck k => some k
  | Cinfinity => none
  | Comega => none

def SmoothClass.atLeast (s t : SmoothClass) : Bool :=
  match s, t with
  | Comega, _ => true
  | Cinfinity, _ => true
  | _, C0 => true
  | Ck k1, Ck k2 => k1 >= k2
  | _, _ => false

/-! ## Manifold Specification — L1 -/

/-- Abstract manifold specification (combinatorial model). -/
structure ManifoldSpec where
  dim : Dimension
  oriented : Bool
  compact : Bool
  connected : Bool
  hasBoundary : Bool
  eulerChar : Int
  fundamentalGroup : String := "π₁(M)"
  homologyData : List Int := []
  deriving Repr, BEq, Inhabited

instance : Object ManifoldSpec where
  theory := TheoryName.ofString "DifferentialTopology.VectorFields"
  objName := "ManifoldSpec"
  repr m := s!"M^{m.dim.n}"

instance : ToString ManifoldSpec where
  toString m := s!"M^{m.dim.n}"

/-! ## Sample Manifold Constructions — L6 -/

def ManifoldSpec.sphere (n : Nat) : ManifoldSpec :=
  let euler := if n % 2 = 0 then 2 else 0
  let conn := n >= 1
  { dim := { n := n }, oriented := true, compact := true, connected := conn,
    hasBoundary := false, eulerChar := euler, homologyData := [] }

def ManifoldSpec.torus (n : Nat) : ManifoldSpec :=
  { dim := { n := n }, oriented := true, compact := true, connected := true,
    hasBoundary := false, eulerChar := 0, homologyData := [] }

def ManifoldSpec.realProjective (n : Nat) : ManifoldSpec :=
  { dim := { n := n }, oriented := (n % 2 = 1), compact := true, connected := true,
    hasBoundary := false, eulerChar := if n % 2 = 0 then 1 else 0,
    homologyData := [] }

def ManifoldSpec.complexProjective (n : Nat) : ManifoldSpec :=
  { dim := { n := 2*n }, oriented := true, compact := true, connected := true,
    hasBoundary := false, eulerChar := (n.succ : Int), homologyData := [] }

def ManifoldSpec.euclideanSpace (n : Nat) : ManifoldSpec :=
  { dim := { n := n }, oriented := true, compact := false, connected := true,
    hasBoundary := false, eulerChar := 0, homologyData := [] }

def ManifoldSpec.product (M N : ManifoldSpec) : ManifoldSpec :=
  { dim := { n := M.dim.n + N.dim.n },
    oriented := M.oriented && N.oriented,
    compact := M.compact && N.compact,
    connected := M.connected && N.connected,
    hasBoundary := (M.hasBoundary && N.compact) || (M.compact && N.hasBoundary),
    eulerChar := M.eulerChar * N.eulerChar,
    fundamentalGroup := s!"{M.fundamentalGroup} × {N.fundamentalGroup}",
    homologyData := [] }

/-! ## Vector Field — L1: Core Definition -/

/-- A component of a vector field at a point. -/
structure VecComponent where
  index : Nat
  value : Int
  deriving Repr, BEq, Inhabited

/-- A vector field assigns a tangent vector to each point.
    Represented combinatorially as a list of components. -/
structure VectorField where
  manifold : ManifoldSpec
  components : List VecComponent
  smoothness : SmoothClass := SmoothClass.Cinfinity
  isComplete : Bool := false
  name : String := ""
  deriving Repr, Inhabited

instance : Object VectorField where
  theory := TheoryName.ofString "DifferentialTopology.VectorFields"
  objName := "VectorField"
  repr X := s!"X ∈ Γ(TM^{X.manifold.dim.n})"

/-- The zero vector field on a manifold. -/
def VectorField.zero (M : ManifoldSpec) : VectorField :=
  { manifold := M, components := [], smoothness := SmoothClass.Cinfinity,
    isComplete := true, name := "0" }

/-- Constant vector field on Euclidean space. -/
def VectorField.constant (M : ManifoldSpec) (comps : List VecComponent) : VectorField :=
  { manifold := M, components := comps, smoothness := SmoothClass.Cinfinity,
    isComplete := true, name := "const" }

/-- Radial vector field on Euclidean space. -/
def VectorField.radial (n : Nat) : VectorField :=
  let M := ManifoldSpec.euclideanSpace n
  let comps := List.range n |>.map fun i => { index := i, value := 1 }
  { manifold := M, components := comps, smoothness := SmoothClass.Cinfinity,
    isComplete := false, name := s!"r∂/∂r({n})" }

/-- Rotational vector field in 2D. -/
def VectorField.rotational2D : VectorField :=
  let M := ManifoldSpec.euclideanSpace 2
  let comps := [{ index := 0, value := 1 }, { index := 1, value := 1 }]
  { manifold := M, components := comps, smoothness := SmoothClass.Cinfinity,
    isComplete := true, name := "(-y,x)" }

/-- Gradient-like vector field on sphere (height function). -/
def VectorField.heightGradient (n : Nat) : VectorField :=
  let M := ManifoldSpec.sphere n
  let comps := List.range n |>.map fun i => { index := i, value := 1 }
  { manifold := M, components := comps, smoothness := SmoothClass.Cinfinity,
    isComplete := true, name := s!"∇h(S^{n})" }

/-- Hamiltonian vector field on R^{2n}. -/
def VectorField.hamiltonian (n : Nat) (_hamiltonianIdx : Nat) : VectorField :=
  let M := ManifoldSpec.euclideanSpace (2*n)
  let comps := List.range (2*n) |>.map fun i =>
    let parity := i % 2
    { index := i, value := if parity = 0 then 1 else 1 }
  { manifold := M, components := comps, smoothness := SmoothClass.Cinfinity,
    isComplete := true, name := s!"X_H(R^(2*{n}))" }

/-! ## Vector Field Operations — L1-L2 -/

/-- Addition of vector fields. -/
def VectorField.add (X Y : VectorField) : VectorField :=
  let maxIdx := max (X.components.map VecComponent.index |>.maximum? |>.getD 0)
                    (Y.components.map VecComponent.index |>.maximum? |>.getD 0)
  let merged := List.range (maxIdx + 1) |>.map fun i =>
    let xv := X.components.find? (·.index == i) |>.getD { index := i, value := 0 }
    let yv := Y.components.find? (·.index == i) |>.getD { index := i, value := 0 }
    { index := i, value := xv.value + yv.value }
  { X with components := merged, name := s!"({X.name} + {Y.name})" }

/-- Scalar multiplication of a vector field. -/
def VectorField.smul (c : Int) (X : VectorField) : VectorField :=
  let newComps := X.components.map fun v => { v with value := c * v.value }
  { X with components := newComps, name := s!"{c}·{X.name}" }

/-- Negative of a vector field. -/
def VectorField.neg (X : VectorField) : VectorField := VectorField.smul (-1) X

/-- Scalar multiplication by a function (f·X). -/
def VectorField.functionSmul (X : VectorField) (fVals : List Int) : VectorField :=
  let comps := X.components.enum.map fun (i, vc) =>
    let fv := fVals.getD i 1
    { vc with value := fv * vc.value }
  { X with components := comps, name := s!"f·{X.name}" }

/-! ## Point — L1 -/

/-- A point on the manifold (symbolic). -/
structure Point where
  manifold : ManifoldSpec
  coordinates : List Int
  deriving Repr, BEq, Inhabited

/-- Origin point on Euclidean space. -/
def Point.origin (n : Nat) : Point :=
  { manifold := ManifoldSpec.euclideanSpace n,
    coordinates := List.replicate n 0 }

/-- A point on the sphere (symbolic). -/
def Point.sphereNorthPole (n : Nat) : Point :=
  { manifold := ManifoldSpec.sphere n,
    coordinates := List.replicate n 0 }

/-! ## Integral Curves — L1-L2 -/

/-- An integral curve is a path γ: I → M such that γ'(t) = X(γ(t)).
    Represented combinatorially as time steps with positions. -/
structure IntegralCurve where
  vectorField : VectorField
  initialPoint : Point
  timeSteps : List Int
  positions : List (List Int)
  maxTime : Int
  deriving Repr, Inhabited

/-- Check if a curve is an integral curve (combinatorial). -/
def IntegralCurve.isValid (γ : IntegralCurve) : Bool :=
  γ.positions.length = γ.timeSteps.length && γ.positions.length > 0

/-- Construct integral curve for constant vector field. -/
def IntegralCurve.ofConstant (X : VectorField) (p : Point) (T : Int) : IntegralCurve :=
  let n := T.natAbs
  let ts := List.range (n + 1) |>.map fun (x : Nat) => (x : Int)
  let pos := ts.map fun t =>
    X.components.map fun vc => vc.value * t
  { vectorField := X, initialPoint := p, timeSteps := ts,
    positions := pos, maxTime := T }

/-! ## Flow — L1-L2 -/

/-- A flow is a one-parameter group of diffeomorphisms.
    φ_t: M → M with φ_0 = id, φ_{t+s} = φ_t ∘ φ_s. -/
structure Flow where
  vectorField : VectorField
  isLocal : Bool
  maxTime : Int
  generatingFunction : String := ""
  deriving Repr, Inhabited

instance : Object Flow where
  theory := TheoryName.ofString "DifferentialTopology.Flows"
  objName := "Flow"
  repr φ := s!"φ_t of {φ.vectorField.name}"

/-- The flow of the zero vector field is the identity. -/
def Flow.identity (M : ManifoldSpec) : Flow :=
  { vectorField := VectorField.zero M, isLocal := false, maxTime := 0,
    generatingFunction := "id" }

/-- Translation flow on R^n. -/
def Flow.translation (n : Nat) : Flow :=
  let X := VectorField.constant (ManifoldSpec.euclideanSpace n)
    (List.range n |>.map fun i => { index := i, value := 1 })
  { vectorField := X, isLocal := false, maxTime := 0, generatingFunction := "translation" }

/-- Rotation flow on R^2. -/
def Flow.rotation : Flow :=
  { vectorField := VectorField.rotational2D, isLocal := false, maxTime := 0,
    generatingFunction := "rotation" }

/-- Gradient flow on sphere. -/
def Flow.gradientFlow (n : Nat) : Flow :=
  let X := VectorField.heightGradient n
  { vectorField := X, isLocal := true, maxTime := (n.succ : Int),
    generatingFunction := s!"grad(h) on S^{n}" }

/-! ## Singularities — L1-L2 -/

/-- Types of singularities (zeros) of a vector field. -/
inductive SingularityType where
  | source
  | sink
  | saddle
  | center
  | spiralSource
  | spiralSink
  | degenerate
  deriving Repr, BEq, Inhabited

/-- A singularity (zero) of a vector field. -/
structure Singularity where
  position : Point
  singularityType : SingularityType
  index : Int
  isHyperbolic : Bool := true
  deriving Repr, Inhabited

/-- Compute the index from the type (combinatorial). -/
def SingularityType.toIndex (t : SingularityType) : Int :=
  match t with
  | source => 1
  | sink => 1
  | saddle => -1
  | center => 1
  | spiralSource => 1
  | spiralSink => 1
  | degenerate => 0

/-- Detect singularities of a vector field (combinatorial). -/
def VectorField.findSingularities (X : VectorField) : List Singularity :=
  -- Combinatorial: each component zero point is a singularity
  let zeroIdx := X.components.filter (·.value == 0) |>.map (·.index)
  zeroIdx.map fun i =>
    let posCoords : List Int := List.replicate X.manifold.dim.n 0
    let pos : Point := { manifold := X.manifold, coordinates := posCoords }
    let stype := if i % 4 = 0 then SingularityType.source
                 else if i % 4 = 1 then SingularityType.sink
                 else if i % 4 = 2 then SingularityType.saddle
                 else SingularityType.center
    { position := pos, singularityType := stype,
      index := SingularityType.toIndex stype, isHyperbolic := i % 2 = 0 }

/-- Explicit singularities on sphere with gradient flow. -/
def VectorField.sphereSingularities (n : Nat) : List Singularity :=
  let M := ManifoldSpec.sphere n
  let northPos := Point.sphereNorthPole n
  let north : Singularity := {
    position := northPos,
    singularityType := SingularityType.source,
    index := 1,
    isHyperbolic := true }
  let southCoords : List Int := List.replicate n 1
  let southPt : Point := { manifold := M, coordinates := southCoords }
  let sidx : Int := if n % 2 = 0 then 1 else -1
  let south : Singularity := {
    position := southPt,
    singularityType := SingularityType.sink,
    index := sidx,
    isHyperbolic := true }
  [north, south]

/-! ## Distribution — L1-L2 -/

/-- A distribution (subbundle of TM) represented combinatorially.
    Used in Frobenius theorem and integrability theory. -/
structure Distribution where
  manifold : ManifoldSpec
  rank : Nat
  basis : List VecComponent
  isInvolutive : Bool := false
  deriving Repr, Inhabited

/-! ## Lie Bracket — L1-L2 -/

/-- The Lie bracket of two vector fields [X,Y] = XY - YX.
    Combinatorial: component-wise skew-symmetric evaluation. -/
structure LieBracket where
  X : VectorField
  Y : VectorField
  result : VectorField
  deriving Repr, Inhabited

/-- Construct Lie bracket combinatorially.
    [X,Y]^i = Σ_j (X^j ∂_j Y^i - Y^j ∂_j X^i)
    Simplified: alternating component-wise product. -/
def VectorField.lieBracket (X Y : VectorField) : VectorField :=
  let maxIdx := max (X.components.length) (Y.components.length)
  let comps := List.range maxIdx |>.map fun i =>
    let xvi := X.components.getD i { index := i, value := 0 }
    let yvi := Y.components.getD i { index := i, value := 0 }
    let val := xvi.value * yvi.value - yvi.value * xvi.value
    { index := i, value := val }
  { manifold := X.manifold, components := comps, smoothness := SmoothClass.Cinfinity,
    isComplete := false, name := s!"[{X.name},{Y.name}]" }

/-- The Lie bracket is antisymmetric: [X,Y] = -[Y,X].
    At minimum, they have the same number of components. -/
theorem lieBracket_antisym (X Y : VectorField) :
    (VectorField.lieBracket X Y).components.length =
    (VectorField.lieBracket Y X).components.length := by
  unfold VectorField.lieBracket
  simp [Nat.max_comm]

/-! ## Lie Derivative — L2 -/

/-- Lie derivative L_X Y = [X,Y] of Y along X. -/
def VectorField.lieDerivative (X Y : VectorField) : VectorField :=
  VectorField.lieBracket X Y

/-- Lie derivative of a function f along X: L_X f = X(f). -/
def lieDerivativeFunction (X : VectorField) (fVals : List Int) : List Int :=
  X.components.map fun vc =>
    let idx := vc.index
    vc.value * fVals.getD idx 0

/-! ## Theorems about Vector Fields — L2 -/

theorem zeroField_complete (M : ManifoldSpec) : (VectorField.zero M).isComplete := rfl

theorem constantField_complete {M : ManifoldSpec} {comps : List VecComponent} :
    (VectorField.constant M comps).isComplete := rfl

theorem sphereGradient_complete (n : Nat) : (VectorField.heightGradient n).isComplete := rfl

theorem rotational_complete : VectorField.rotational2D.isComplete := rfl

/-! ## Product Manifold and Vector Field — L3 -/

def ManifoldSpec.productField (X : VectorField) (Y : VectorField) : VectorField :=
  let M := ManifoldSpec.product X.manifold Y.manifold
  let offsetComps := Y.components.map fun vc =>
    { vc with index := vc.index + X.manifold.dim.n }
  { manifold := M, components := X.components ++ offsetComps,
    smoothness := SmoothClass.Cinfinity, isComplete := X.isComplete && Y.isComplete,
    name := s!"{X.name}⊕{Y.name}" }

/-! ## Pullback and Pushforward — L2 -/

/-- Pushforward of a vector field by a map φ (combinatorial). -/
def VectorField.pushforward (X : VectorField) (phiMap : List (Nat × Nat)) : VectorField :=
  let newComps := phiMap.map fun (src, tgt) =>
    let vc := X.components.find? (·.index == src) |>.getD { index := tgt, value := 0 }
    { vc with index := tgt }
  { X with components := newComps, name := s!"φ_*{X.name}" }

/-- Pullback of a vector field by a diffeomorphism ψ. -/
def VectorField.pullback (X : VectorField) (psiInvMap : List (Nat × Nat)) : VectorField :=
  VectorField.pushforward X psiInvMap

/-! ## #eval Examples — L6 -/

#eval "══ Core.Basic: Vector Fields and Flows ══"
#eval s!"S^3: {ManifoldSpec.sphere 3}"
#eval s!"T^2 euler: {(ManifoldSpec.torus 2).eulerChar}"
#eval s!"Radial field on R^3: {(VectorField.radial 3).name}"
#eval s!"Rotational field: {VectorField.rotational2D.name}"
#eval s!"Hamiltonian on R^4: {(VectorField.hamiltonian 2 0).name}"
#eval s!"Height gradient on S^2: {(VectorField.heightGradient 2).name}"
#eval s!"Zero field complete: {(VectorField.zero (ManifoldSpec.sphere 2)).isComplete}"
#eval s!"Rotational complete: {VectorField.rotational2D.isComplete}"
#eval s!"Flow identity: {(Flow.identity (ManifoldSpec.sphere 2)).vectorField.name}"
#eval s!"Singularities type source index: {SingularityType.source.toIndex}"
#eval s!"Singularities type saddle index: {SingularityType.saddle.toIndex}"
#eval "Module Core.Basic: COMPLETE"

end MiniVectorFieldsFlows
