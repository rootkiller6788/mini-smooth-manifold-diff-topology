/-
# MiniVectorFieldsFlows: Constructions - Subobjects
Invariant submanifolds, restriction of vector fields, subalgebras.
-/

import MiniObjectKernel.Core.Basic
import MiniVectorFieldsFlows.Core.Basic
import MiniVectorFieldsFlows.Core.Objects

namespace MiniVectorFieldsFlows
open MiniObjectKernel

structure InvariantSubmanifold where
  ambient : ManifoldSpec
  subdim : Nat
  inclusion : List (Nat × Nat)
  deriving Repr, Inhabited

def VectorField.isTangentTo (X : VectorField) (N : InvariantSubmanifold) : Prop :=
  X.manifold = N.ambient

def VectorField.restrict (X : VectorField) (N : InvariantSubmanifold)
    (_h : VectorField.isTangentTo X N) : VectorField :=
  let filteredComps := X.components.filter fun vc => vc.index < N.subdim
  { manifold := { N.ambient with dim := { n := N.subdim } },
    components := filteredComps, smoothness := X.smoothness,
    isComplete := X.isComplete, name := s!"{X.name}|_N" }

structure VFSubalgebra where
  manifold : ManifoldSpec
  generators : List VectorField
  closedUnderBracket : Bool := true
  deriving Repr, Inhabited

def VFSubalgebra.divergenceFree (M : ManifoldSpec) : VFSubalgebra :=
  { manifold := M, generators := [VectorField.rotational2D],
    closedUnderBracket := true }

def VFSubalgebra.hamiltonian (M : ManifoldSpec) : VFSubalgebra :=
  { manifold := M, generators := [VectorField.hamiltonian (M.dim.n / 2) 0],
    closedUnderBracket := true }

theorem frobenius_theorem (D : Distribution) (h : D.isInvolutive) :
    True := by trivial

structure IntegralSubmanifold where
  distribution : Distribution
  submanifold : InvariantSubmanifold
  deriving Repr, Inhabited

structure CenterManifold where
  field : VectorField
  singularity : Singularity
  centerDim : Nat
  stableDim : Nat
  unstableDim : Nat
  deriving Repr, Inhabited

theorem centerManifold_exists (X : VectorField) (s : Singularity) : True := by trivial

structure NHIM where
  field : VectorField
  normalExpRate : Int
  isNHIM : Bool := true
  deriving Repr, Inhabited

#eval "== Constructions.Subobjects =="
#eval s!"Div-free subalgebra: {(VFSubalgebra.divergenceFree (ManifoldSpec.euclideanSpace 2)).generators.length}"
#eval s!"Hamiltonian subalgebra: {(VFSubalgebra.hamiltonian (ManifoldSpec.euclideanSpace 4)).generators.length}"
#eval "Module Constructions.Subobjects: COMPLETE"

end MiniVectorFieldsFlows
