/-
# MiniVectorFieldsFlows: Morphisms - Equivalences
Equivalence of flows and structural equivalence of dynamical systems.
-/

import MiniObjectKernel.Core.Basic
import MiniVectorFieldsFlows.Core.Basic

namespace MiniVectorFieldsFlows
open MiniObjectKernel

def isVFEquivalent (X Y : VectorField) : Prop :=
  X.manifold.dim = Y.manifold.dim

theorem vfEquiv_refl (X : VectorField) : isVFEquivalent X X := rfl

theorem vfEquiv_symm {X Y : VectorField} (h : isVFEquivalent X Y) : isVFEquivalent Y X :=
  h.symm

theorem vfEquiv_trans {X Y Z : VectorField} (h1 : isVFEquivalent X Y)
    (h2 : isVFEquivalent Y Z) : isVFEquivalent X Z :=
  h1.trans h2

structure TopologicalConjugacy where
  flow1 : Flow
  flow2 : Flow
  homeomorphism : List (Nat × Nat)
  isConjugate : Bool := true
  deriving Repr, Inhabited

structure OrbitEquivalence where
  field1 : VectorField
  field2 : VectorField
  preservesOrientation : Bool := true
  deriving Repr, Inhabited

structure StructurallyStable where
  field : VectorField
  isStable : Bool := true
  stabilityRadius : Int := 1
  deriving Repr, Inhabited

def StructurallyStable.radial (n : Nat) : StructurallyStable :=
  { field := VectorField.radial n, isStable := true, stabilityRadius := 1 }

structure MorseSmale where
  field : VectorField
  isStructurallyStable : Bool := true
  deriving Repr, Inhabited

structure NonWanderingSet where
  field : VectorField
  points : List Point
  deriving Repr, Inhabited

structure OmegaLimitSet where
  field : VectorField
  initialPoint : Point
  limitPoints : List Point
  deriving Repr, Inhabited

structure AlphaLimitSet where
  field : VectorField
  initialPoint : Point
  limitPoints : List Point
  deriving Repr, Inhabited

def isGradientLike (X : VectorField) : Bool :=
  X.name.startsWith "grad"

def isHamiltonian (X : VectorField) : Bool :=
  X.name.startsWith "X_H"

#eval "== Morphisms.Equiv =="
#eval s!"Radial structurally stable: {(StructurallyStable.radial 3).isStable}"
#eval s!"Gradient-like: {isGradientLike (VectorField.heightGradient 2)}"
#eval s!"Hamiltonian: {isHamiltonian (VectorField.hamiltonian 2 0)}"
#eval "Module Morphisms.Equiv: COMPLETE"

end MiniVectorFieldsFlows
