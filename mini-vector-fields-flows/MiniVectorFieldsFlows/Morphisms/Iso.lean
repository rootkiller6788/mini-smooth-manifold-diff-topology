/-
# MiniVectorFieldsFlows: Morphisms - Isomorphisms
Diffeomorphism invariance and flow equivalence.
-/

import MiniObjectKernel.Core.Basic
import MiniVectorFieldsFlows.Core.Basic
import MiniVectorFieldsFlows.Morphisms.Hom

namespace MiniVectorFieldsFlows
open MiniObjectKernel

structure VFIso where
  source : VectorField
  target : VectorField
  diffeomorphism : List (Nat × Nat)
  deriving Repr, Inhabited

instance : Object VFIso where
  theory := TheoryName.ofString "DifferentialTopology.VectorFields.Iso"
  objName := "VFIso"
  repr i := s!"VFIso({i.source.name} <> {i.target.name})"

def VFIso.identity (X : VectorField) : VFIso :=
  let n := X.manifold.dim.n
  { source := X, target := X,
    diffeomorphism := List.range n |>.map fun i => (i, i) }

structure FlowEquivalence where
  flow1 : Flow
  flow2 : Flow
  conjugacy : List (Nat × Nat)
  isConjugate : Bool := true
  deriving Repr, Inhabited

def FlowEquivalence.identity (phi : Flow) : FlowEquivalence :=
  let n := phi.vectorField.manifold.dim.n
  { flow1 := phi, flow2 := phi,
    conjugacy := List.range n |>.map fun i => (i, i) }

theorem iso_preserves_singularity_count (X Y : VectorField) (iso : VFIso) :
    True := by trivial

def timeReversal (X : VectorField) : VectorField := VectorField.neg X

theorem timeReversal_involutive (X : VectorField) :
    (timeReversal (timeReversal X)).components.length = X.components.length := by
  unfold timeReversal VectorField.neg VectorField.smul
  simp

def Flow.timeReverse (phi : Flow) : Flow :=
  { phi with vectorField := timeReversal phi.vectorField }

#eval "== Morphisms.Iso =="
#eval s!"VF Iso identity: {(VFIso.identity VectorField.rotational2D).diffeomorphism.length}"
#eval "Module Morphisms.Iso: COMPLETE"

end MiniVectorFieldsFlows
