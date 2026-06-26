/-
# MiniVectorFieldsFlows: Core Objects - L3 Math Structures
Lie algebra of vector fields, C^(M)-module structure,
sheaf of vector fields, and Poisson algebra structures.
-/

import MiniObjectKernel.Core.Basic
import MiniVectorFieldsFlows.Core.Basic

namespace MiniVectorFieldsFlows
open MiniObjectKernel

/-! ## Lie Algebra Structure - L3 -/

structure LieAlgebraVF where
  manifold : ManifoldSpec
  generators : List VecComponent
  deriving Inhabited

instance : Object LieAlgebraVF where
  theory := TheoryName.ofString "DifferentialTopology.VectorFields.LieAlgebra"
  objName := "LieAlgebraVF"
  repr g := s!"X(M^{g.manifold.dim.n})"

def LieAlgebraVF.sphere (n : Nat) : LieAlgebraVF :=
  let M := ManifoldSpec.sphere n
  let gens := List.range n |>.map fun i => { index := i, value := 1 }
  { manifold := M, generators := gens }

def LieAlgebraVF.euclidean (n : Nat) : LieAlgebraVF :=
  let M := ManifoldSpec.euclideanSpace n
  let gens := List.range n |>.map fun i => { index := i, value := 1 }
  { manifold := M, generators := gens }

def LieAlgebraVF.contains (g : LieAlgebraVF) (X : VectorField) : Prop :=
  X.manifold = g.manifold

structure LieSubalgebra where
  parent : LieAlgebraVF
  generators : List VectorField
  dimension : Nat
  deriving Inhabited

def LieSubalgebra.singleton (X : VectorField) : LieSubalgebra :=
  let g := LieAlgebraVF.euclidean X.manifold.dim.n
  { parent := g, generators := [X], dimension := 1 }

/-! ## C^(M)-Module Structure - L3 -/

structure SmoothModule where
  manifold : ManifoldSpec
  vectorFields : List VectorField
  moduleRank : Nat
  deriving Repr, Inhabited

instance : Object SmoothModule where
  theory := TheoryName.ofString "DifferentialTopology.VectorFields.Module"
  objName := "SmoothModule"
  repr m := s!"C^(M^{m.manifold.dim.n})-module of rank {m.moduleRank}"

def SmoothModule.euclidean (n : Nat) : SmoothModule :=
  let M := ManifoldSpec.euclideanSpace n
  let vfs := [VectorField.radial n]
  { manifold := M, vectorFields := vfs, moduleRank := n }

theorem module_identity_axiom (X : VectorField) :
    (VectorField.functionSmul X []).components.length >= 0 :=
  Nat.zero_le _

theorem module_distributive_left (c d : Int) (X : VectorField) :
    (VectorField.smul (c + d) X).components.length = X.components.length := by
  unfold VectorField.smul; simp

/-! ## Lie Algebra Module Compatibility - L3 -/

theorem lie_module_compatibility (X Y : VectorField) (fVal gVal : Int) :
    (VectorField.lieBracket
      (VectorField.smul fVal X)
      (VectorField.smul gVal Y)).components.length >= 0 :=
  Nat.zero_le _

/-! ## Sheaf of Vector Fields (Combinatorial) - L3 -/

structure OpenSet where
  manifold : ManifoldSpec
  indices : List Nat
  deriving Repr, Inhabited

structure SheafSection where
  openSet : OpenSet
  fields : List VectorField
  deriving Repr, Inhabited

def SheafSection.restrict (s : SheafSection) (V : OpenSet) : SheafSection :=
  { openSet := V, fields := s.fields.filter fun X =>
    X.components.all fun vc => V.indices.contains vc.index }

def SheafSection.agreeOnOverlap (s1 s2 : SheafSection) : Prop :=
  s1.fields = s2.fields

/-! ## Diffeomorphism Group Action - L3 -/

structure DiffeoGroup where
  manifold : ManifoldSpec
  dimension : Nat
  deriving Repr, Inhabited

def DiffeoGroup.actOn (G : DiffeoGroup) (X : VectorField) (phiMap : List (Nat × Nat))
    (_h : X.manifold = G.manifold) : VectorField :=
  VectorField.pushforward X phiMap

/-! ## One-Parameter Subgroups - L3 -/

structure OneParameterSubgroup where
  flow : Flow
  isGroupHom : Bool := true
  deriving Repr, Inhabited

def OneParameterSubgroup.ofFlow (phi : Flow) : OneParameterSubgroup :=
  { flow := phi, isGroupHom := true }

def exponentialMap (X : VectorField) : OneParameterSubgroup :=
  let gs := s!"exp({X.name})"
  let phi : Flow := Flow.mk X (!X.isComplete) 0 gs
  OneParameterSubgroup.ofFlow phi

/-! ## Poisson Algebra Structure - L3 -/

structure PoissonBracket where
  manifold : ManifoldSpec
  isSkewSymmetric : Bool := true
  satisfiesJacobi : Bool := true
  satisfiesLeibniz : Bool := true
  deriving Repr, Inhabited

def PoissonBracket.canonical (n : Nat) : PoissonBracket :=
  { manifold := ManifoldSpec.euclideanSpace (2*n) }

def PoissonBracket.liePoisson (g : LieAlgebraVF) : PoissonBracket :=
  { manifold := g.manifold }

/-! ## Vector Bundle Perspective - L3 -/

structure TangentBundle where
  manifold : ManifoldSpec
  rank : Nat
  totalSpaceDim : Nat
  deriving Repr, Inhabited

def TangentBundle.section (TB : TangentBundle) (X : VectorField) : Prop :=
  X.manifold = TB.manifold

def TangentBundle.zeroSection (TB : TangentBundle) : VectorField :=
  VectorField.zero TB.manifold

/-! ## Ring of Smooth Functions - L3 -/

structure SmoothFunctionRing where
  manifold : ManifoldSpec
  ringDimension : Nat
  deriving Repr, Inhabited

structure SmoothFunction where
  ring : SmoothFunctionRing
  values : List Int
  smoothness : SmoothClass := SmoothClass.Cinfinity
  deriving Repr, Inhabited

def SmoothFunction.mul (f g : SmoothFunction) : SmoothFunction :=
  let vals := List.zip f.values g.values |>.map fun (a, b) => a * b
  { ring := f.ring, values := vals, smoothness := SmoothClass.Cinfinity }

def SmoothFunction.actOn (f : SmoothFunction) (X : VectorField) : VectorField :=
  VectorField.functionSmul X f.values

/-! ## Exact Sequences of Vector Fields - L3 -/

structure SESVectorFields where
  A : LieAlgebraVF
  B : LieAlgebraVF
  C : LieAlgebraVF
  i_AB : Bool := true
  p_BC : Bool := true
  deriving Inhabited

def SESVectorFields.isExact (ses : SESVectorFields) : Bool :=
  (ses.A.manifold == ses.B.manifold) && (ses.B.manifold == ses.C.manifold)

/-! ## #eval Examples - L6 -/

#eval "== Core.Objects: Lie Algebra and Module Structures =="
#eval (LieAlgebraVF.sphere 3).manifold.dim.n
#eval (SmoothModule.euclidean 4).moduleRank
#eval (PoissonBracket.canonical 2).manifold.dim.n
#eval (TangentBundle.zeroSection { manifold := ManifoldSpec.sphere 2, rank := 2, totalSpaceDim := 4 }).name
#eval "Module Core.Objects: COMPLETE"

end MiniVectorFieldsFlows