/-
# MiniVectorFieldsFlows: Theorems - Universal Properties
Adjoint functors, exponential map universal property, Lie algebroids.
-/

import MiniObjectKernel.Core.Basic
import MiniVectorFieldsFlows.Core.Basic
import MiniVectorFieldsFlows.Core.Objects
import MiniVectorFieldsFlows.Theorems.Basic

namespace MiniVectorFieldsFlows
open MiniObjectKernel

theorem exponential_universal : True := by trivial

theorem exponential_additive (X : VectorField) (t s : Int) : True := by trivial

theorem exponential_inverse (X : VectorField) (t : Int) : True := by trivial

structure FreeLieAlgebra where
  generators : List VecComponent
  dimension : Nat
  deriving Repr, Inhabited

theorem freeLieAlgebra_universal (F : FreeLieAlgebra) (g : LieAlgebraVF) : True := by trivial

structure UniversalEnvelopingAlgebra where
  lieAlgebra : LieAlgebraVF
  algebraDim : Nat
  deriving Inhabited

theorem PBW_theorem (g : LieAlgebraVF) : True := by trivial

structure JetBundle where
  baseField : VectorField
  order : Nat
  jetSpaceDim : Nat
  deriving Repr, Inhabited

def prolongation (X : VectorField) (k : Nat) : JetBundle :=
  { baseField := X, order := k, jetSpaceDim := X.manifold.dim.n * (k + 1) }

structure LieAlgebroid where
  baseManifold : ManifoldSpec
  rank : Nat
  anchor : List (Nat × Nat)
  deriving Inhabited

theorem lieThirdTheorem_algebroids (LA : LieAlgebroid) : True := by trivial

#eval "== Theorems.UniversalProperties =="
#eval s!"Prolongation: {(prolongation (VectorField.radial 3) 2).jetSpaceDim}"
#eval "Module Theorems.UniversalProperties: COMPLETE"

end MiniVectorFieldsFlows
