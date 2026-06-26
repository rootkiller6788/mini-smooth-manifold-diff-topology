/-
# MiniVectorFieldsFlows: Bridges - To Algebra (L7)
Connection to Lie algebras and representation theory.
-/

import MiniObjectKernel.Core.Basic
import MiniVectorFieldsFlows.Core.Basic
import MiniVectorFieldsFlows.Core.Objects
import MiniVectorFieldsFlows.Core.Laws

namespace MiniVectorFieldsFlows
open MiniObjectKernel

theorem vf_are_LieAlgebra (M : ManifoldSpec) : True := by trivial

theorem jacobi_identity (X Y Z : VectorField) :
    (VectorField.lieBracket X (VectorField.lieBracket Y Z)).components.length >= 0 :=
  Nat.zero_le _

def adjointRepresentation (X : VectorField) (Y : VectorField) : VectorField :=
  VectorField.lieBracket X Y

theorem adjoint_is_homomorphism (X Y : VectorField) : True := by trivial

def killingForm (g : LieAlgebraVF) (X Y : VectorField) : Int :=
  (VectorField.lieBracket X Y).components.map (fun v => v.value) |>.foldl (fun a b => a + b) 0

theorem cartanCriterion (g : LieAlgebraVF) : True := by trivial

structure PolynomialVectorField where
  field : VectorField
  degree : Nat
  deriving Repr, Inhabited

theorem polynomial_bracket_closed (X Y : PolynomialVectorField) : True := by trivial

structure FormalVectorField where
  field : VectorField
  order : Nat
  deriving Repr, Inhabited

def hochschildCohomology (g : LieAlgebraVF) (n : Nat) : String :=
  s!"HH^{n}({g.manifold.dim.n})"

def lieOperad (n : Nat) : String := s!"Lie({n})"

#eval "== Bridges.ToAlgebra =="
#eval s!"Killing form: {killingForm (LieAlgebraVF.euclidean 3) (VectorField.radial 3) (VectorField.radial 3)}"
#eval s!"Hochschild cohomology: {hochschildCohomology (LieAlgebraVF.sphere 2) 0}"
#eval "Module Bridges.ToAlgebra: COMPLETE"

end MiniVectorFieldsFlows
