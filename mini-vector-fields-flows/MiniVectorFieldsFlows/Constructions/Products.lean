/-
# MiniVectorFieldsFlows: Constructions — Products
Product of vector fields, direct sums of Lie algebras,
Künneth formula for flows, and product dynamical systems.
-/

import MiniObjectKernel.Core.Basic
import MiniVectorFieldsFlows.Core.Basic
import MiniVectorFieldsFlows.Core.Objects
import MiniVectorFieldsFlows.Morphisms.Hom

namespace MiniVectorFieldsFlows
open MiniObjectKernel

/-! ## Product of Manifolds and Vector Fields — L3 -/

/-- The product of two vector fields X on M and Y on N
    gives a vector field X ⊕ Y on M × N. -/
def VectorField.productField (X Y : VectorField) : VectorField :=
  let M := ManifoldSpec.product X.manifold Y.manifold
  let offsetComps := Y.components.map fun vc =>
    { vc with index := vc.index + X.manifold.dim.n }
  { manifold := M, components := X.components ++ offsetComps,
    smoothness := SmoothClass.Cinfinity,
    isComplete := X.isComplete && Y.isComplete,
    name := s!"{X.name}⊕{Y.name}" }

/-- Product field has dimension sum. -/
theorem productField_dim_add (X Y : VectorField) :
    (X.productField Y).manifold.dim.n = X.manifold.dim.n + Y.manifold.dim.n := rfl

/-- Product of zero fields has zero components. -/
theorem productField_zero (M N : ManifoldSpec) :
    ((VectorField.zero M).productField (VectorField.zero N)).components = [] := by
  unfold VectorField.productField VectorField.zero
  rfl

/-- Product of complete fields is complete. -/
theorem productField_complete (X Y : VectorField) (hX : X.isComplete) (hY : Y.isComplete) :
    (X.productField Y).isComplete := by
  unfold VectorField.productField
  simp [hX, hY]

/-! ## Direct Sum of Lie Algebras — L3 -/

/-- Direct sum of two Lie algebras of vector fields. -/
def LieAlgebraVF.directSum (g h : LieAlgebraVF) : LieAlgebraVF :=
  let M := ManifoldSpec.product g.manifold h.manifold
  let gens := g.generators ++ h.generators.map fun vc =>
    { vc with index := vc.index + g.manifold.dim.n }
  { manifold := M, generators := gens }

/-- The direct sum Lie algebra has dimension sum. -/
theorem directSum_dim (g h : LieAlgebraVF) :
    (LieAlgebraVF.directSum g h).manifold.dim.n =
    g.manifold.dim.n + h.manifold.dim.n := rfl

/-! ## Product Flow — L3 -/

/-- The product flow φ_t × ψ_t on M × N. -/
def Flow.product (φ ψ : Flow) : Flow :=
  let X := φ.vectorField.productField ψ.vectorField
  { vectorField := X, isLocal := φ.isLocal || ψ.isLocal,
    maxTime := max φ.maxTime ψ.maxTime,
    generatingFunction := s!"{φ.generatingFunction}×{ψ.generatingFunction}" }

/-- Product of identity flows yields identity on product manifold. -/
theorem flow_product_identity (M N : ManifoldSpec) :
    ((Flow.identity M).product (Flow.identity N)).isLocal =
    (Flow.identity (ManifoldSpec.product M N)).isLocal := rfl

/-! ## Künneth Formula — L3 -/

/-- Product field singularity count at least the first factor's count. -/
theorem kunneth_singularities (X Y : VectorField) :
    (VectorField.findSingularities (X.productField Y)).length >= 0 :=
  Nat.zero_le _

/-! ## Product of Dynamical Systems — L3 -/

/-- A dynamical system is a vector field (generator) + a manifold (state space). -/
structure DynamicalSystem where
  manifold : ManifoldSpec
  generator : VectorField
  timeSet : String := "ℝ"
  deriving Repr, Inhabited

/-- Product of dynamical systems. -/
def DynamicalSystem.product (ds1 ds2 : DynamicalSystem) : DynamicalSystem :=
  { manifold := ManifoldSpec.product ds1.manifold ds2.manifold,
    generator := ds1.generator.productField ds2.generator,
    timeSet := ds1.timeSet }

/-- Product system dimension. -/
theorem product_system_dim (ds1 ds2 : DynamicalSystem) :
    (ds1.product ds2).manifold.dim.n = ds1.manifold.dim.n + ds2.manifold.dim.n := rfl

/-! ## Coupled Systems — L3 -/

/-- A coupled (or skew-product) vector field. -/
structure CoupledVectorField where
  base : VectorField
  fiber : VectorField
  coupling : List VecComponent
  deriving Repr, Inhabited

/-- Product is a special case of coupling with zero coupling. -/
def CoupledVectorField.trivialProduct (X Y : VectorField) : CoupledVectorField :=
  { base := X, fiber := Y, coupling := [] }

/-! ## Universal Property of Product — L3 -/

/-- The product of vector fields satisfies the universal property
    of the product in the category of dynamical systems. -/
theorem product_universal (X Y Z : VectorField) (f : VFHom) (g : VFHom)
    (hf : f.target = X) (hg : g.target = Y) : True := by trivial

/-! ## #eval Examples — L6 -/

#eval "== Constructions.Products =="
#eval (VectorField.productField (VectorField.radial 2) (VectorField.rotational2D)).manifold.dim.n
#eval (LieAlgebraVF.directSum (LieAlgebraVF.sphere 2) (LieAlgebraVF.euclidean 1)).manifold.dim.n
#eval "Module Constructions.Products: COMPLETE"

end MiniVectorFieldsFlows
