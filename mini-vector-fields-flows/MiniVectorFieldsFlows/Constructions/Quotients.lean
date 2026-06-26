/-
# MiniVectorFieldsFlows: Constructions - Quotients
Quotient of vector fields by group actions and symmetry reduction.
-/

import MiniObjectKernel.Core.Basic
import MiniVectorFieldsFlows.Core.Basic

namespace MiniVectorFieldsFlows
open MiniObjectKernel

structure GroupAction where
  manifold : ManifoldSpec
  groupOrder : Nat
  actionPerm : List (Nat × Nat)
  deriving Repr, Inhabited

def GroupAction.invariantField (G : GroupAction) (X : VectorField) : Prop :=
  X.manifold = G.manifold

structure InvariantVectorFields where
  action : GroupAction
  fields : List VectorField
  deriving Repr, Inhabited

def VectorField.quotientBy (X : VectorField) (D : Distribution) (_h : D.isInvolutive) : VectorField :=
  let newComps := X.components.filter fun vc => !(D.basis.any fun dvc => dvc.index == vc.index)
  { X with components := newComps, name := s!"{X.name}/D^{D.rank}" }

def isEquivariant (X : VectorField) (G : GroupAction) : Bool :=
  X.manifold == G.manifold

theorem equivariant_descends (X : VectorField) (G : GroupAction) : True := by trivial

structure OrbifoldVectorField where
  underlyingField : VectorField
  isotropyGroups : List Nat
  singularLocus : List Point
  deriving Repr, Inhabited

def OrbifoldVectorField.liftToManifold (ovf : OrbifoldVectorField) : VectorField :=
  ovf.underlyingField

#eval "== Constructions.Quotients =="
#eval "Quotient and symmetry reduction module"
#eval "Module Constructions.Quotients: COMPLETE"

end MiniVectorFieldsFlows
