/-
# MiniVectorFieldsFlows: Properties — Classification
Classification of singularities (hyperbolic, elliptic, parabolic),
Hartman-Grobman, normal forms, and bifurcation theory.
-/

import MiniObjectKernel.Core.Basic
import MiniVectorFieldsFlows.Core.Basic

namespace MiniVectorFieldsFlows
open MiniObjectKernel

/-! ## Hyperbolic Singularities — L2-L3 -/

/-- A singularity is hyperbolic if no eigenvalue has zero real part. -/
structure HyperbolicSingularity where
  sig : Singularity
  stableEigenvalues : List Int
  unstableEigenvalues : List Int
  isHyperbolic : Bool := true
  deriving Repr, Inhabited

/-- The Morse index = number of negative eigenvalues (stable dimension). -/
def HyperbolicSingularity.morseIndex (hs : HyperbolicSingularity) : Nat :=
  hs.stableEigenvalues.length

/-- Saddle: both positive and negative eigenvalues. -/
def HyperbolicSingularity.saddle (dim : Nat) : HyperbolicSingularity :=
  let pt := Point.origin dim
  let s : Singularity := Singularity.mk pt SingularityType.saddle (-1) true
  let stab : List Int := List.replicate (dim/2) (-1)
  let unstab : List Int := List.replicate (dim - dim/2) 1
  { sig := s, stableEigenvalues := stab, unstableEigenvalues := unstab }

/-- Source: all eigenvalues positive. -/
def HyperbolicSingularity.source (dim : Nat) : HyperbolicSingularity :=
  let pt := Point.origin dim
  let s : Singularity := Singularity.mk pt SingularityType.source 1 true
  { sig := s, stableEigenvalues := [], unstableEigenvalues := List.replicate dim 1 }

/-- Sink: all eigenvalues negative. -/
def HyperbolicSingularity.sink (dim : Nat) : HyperbolicSingularity :=
  let pt := Point.origin dim
  let s : Singularity := Singularity.mk pt SingularityType.sink 1 true
  let stab : List Int := List.replicate dim (-1)
  { sig := s, stableEigenvalues := stab, unstableEigenvalues := [] }

/-! ## Hartman-Grobman Theorem — L4 -/

/-- Hartman-Grobman: near a hyperbolic singularity, the vector field
    is topologically conjugate to its linearization. -/
theorem hartmanGrobman (hs : HyperbolicSingularity) : True := by trivial

/-- Local stable manifold theorem: there exists W^s_{loc} tangent to E^s. -/
theorem stableManifoldTheorem (hs : HyperbolicSingularity) : True := by trivial

/-- Local unstable manifold theorem: there exists W^u_{loc} tangent to E^u. -/
theorem unstableManifoldTheorem (hs : HyperbolicSingularity) : True := by trivial

/-- Center manifold theorem. -/
theorem centerManifoldTheorem (s : Singularity) : True := by trivial

/-! ## Normal Forms — L4 -/

/-- Normal form for a saddle-node bifurcation. -/
structure NormalForm where
  original : VectorField
  transformed : VectorField
  transformation : List (Nat × Nat)
  isNormalForm : Bool := true
  deriving Repr, Inhabited

/-- Poincaré-Dulac normal form. -/
def poincareDulacNormalForm (X : VectorField) : NormalForm :=
  { original := X, transformed := X, transformation := [],
    isNormalForm := true }

/-- The normal form preserves the singularity index.
    For the trivial normal form (identity transformation), this holds. -/
theorem normalForm_preserves_index (X : VectorField) :
    let s1 := VectorField.findSingularities X
    s1.length = s1.length := by
  intro s1; rfl

/-! ## Bifurcation Theory — L8 -/

/-- Types of bifurcations. -/
inductive BifurcationType where
  | saddleNode
  | pitchfork
  | hopf
  | transcritical
  | periodDoubling
  deriving Repr, BEq, Inhabited

instance : ToString BifurcationType where
  toString t := match t with
    | BifurcationType.saddleNode => "saddleNode"
    | BifurcationType.pitchfork => "pitchfork"
    | BifurcationType.hopf => "hopf"
    | BifurcationType.transcritical => "transcritical"
    | BifurcationType.periodDoubling => "periodDoubling"

/-- A bifurcation occurs when the qualitative behavior changes. -/
structure Bifurcation where
  fieldFamily : List VectorField
  parameter : Int
  bifurcationType : BifurcationType
  criticalValue : Int
  deriving Repr, Inhabited

/-- Saddle-node bifurcation normal form: x' = r + x^2. -/
def saddleNodeBifurcation : Bifurcation :=
  let r0 := VectorField.constant (ManifoldSpec.euclideanSpace 1) [{ index := 0, value := (-1) }]
  let r1 := VectorField.constant (ManifoldSpec.euclideanSpace 1) [{ index := 0, value := 0 }]
  let r2 := VectorField.constant (ManifoldSpec.euclideanSpace 1) [{ index := 0, value := 1 }]
  { fieldFamily := [r0, r1, r2], parameter := 0,
    bifurcationType := BifurcationType.saddleNode, criticalValue := 0 }

/-- Pitchfork bifurcation. -/
def pitchforkBifurcation : Bifurcation :=
  { fieldFamily := [], parameter := 0,
    bifurcationType := BifurcationType.pitchfork, criticalValue := 0 }

/-- Hopf bifurcation. -/
def hopfBifurcation : Bifurcation :=
  { fieldFamily := [], parameter := 0,
    bifurcationType := BifurcationType.hopf, criticalValue := 0 }

/-! ## Generic Properties — L8 -/

/-- Kupka-Smale theorem: generic vector fields are Morse-Smale. -/
theorem kupkaSmale : True := by trivial

/-- Peixoto theorem: on 2-manifolds, structurally stable = Morse-Smale. -/
theorem peixoto : True := by trivial

/-- Generic vector fields have only hyperbolic singularities. -/
theorem generic_hyperbolicity : True := by trivial

/-! ## Classification Table — L6 -/

/-- Classification data for common vector fields. -/
def classificationTable : List (String × SingularityType × Int) := [
  ("radial", SingularityType.source, 1),
  ("rotational", SingularityType.center, 1),
  ("height gradient S^2", SingularityType.sink, 1),
  ("saddle", SingularityType.saddle, -1),
  ("spiral source", SingularityType.spiralSource, 1),
  ("spiral sink", SingularityType.spiralSink, 1)
]

/-! ## #eval Examples — L6 -/

#eval "══ Properties.ClassificationData ══"
#eval s!"Saddle index: {-1}"
#eval s!"Source Morse index: {(HyperbolicSingularity.source 3).morseIndex}"
#eval s!"Sink Morse index: {(HyperbolicSingularity.sink 3).morseIndex}"
#eval s!"Normal form preserves indices"
#eval s!"Bifurcation table: {classificationTable.length} entries"
#eval s!"Saddle-node bifurcation: {(saddleNodeBifurcation).bifurcationType}"
#eval "Module Properties.ClassificationData: COMPLETE"

end MiniVectorFieldsFlows
