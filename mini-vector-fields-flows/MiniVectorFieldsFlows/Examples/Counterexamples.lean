/-
# MiniVectorFieldsFlows: Examples - Counterexamples (L6)
Pathological vector fields that demonstrate sharpness of theorems.
-/

import MiniObjectKernel.Core.Basic
import MiniVectorFieldsFlows.Core.Basic

namespace MiniVectorFieldsFlows
open MiniObjectKernel

def incompleteFieldR : VectorField :=
  let M := ManifoldSpec.euclideanSpace 1
  { manifold := M, components := [{ index := 0, value := 2 }],
    smoothness := SmoothClass.Cinfinity, isComplete := false, name := "x^2 d/dx" }

def nonMorseSingularity : VectorField :=
  let M := ManifoldSpec.euclideanSpace 1
  { manifold := M, components := [{ index := 0, value := 3 }],
    smoothness := SmoothClass.Cinfinity, isComplete := true, name := "x^3 d/dx" }

def nonInvolutiveDistribution : Distribution :=
  Distribution.mk (ManifoldSpec.euclideanSpace 3) 2
    [{ index := 0, value := 1 }, { index := 1, value := 1 }] false

def centerSingularity : VectorField :=
  let M := ManifoldSpec.euclideanSpace 2
  { manifold := M, components := [{ index := 0, value := 1 }, { index := 1, value := 1 }],
    smoothness := SmoothClass.Cinfinity, isComplete := true, name := "(-y, x)" }

def structurallyUnstable : VectorField :=
  let M := ManifoldSpec.euclideanSpace 2
  { manifold := M, components := [{ index := 0, value := 1 }, { index := 1, value := 1 }],
    smoothness := SmoothClass.Cinfinity, isComplete := true, name := "unstable_center" }

def nonIsolatedZeros : VectorField :=
  let M := ManifoldSpec.euclideanSpace 2
  { manifold := M, components := [{ index := 0, value := 0 }, { index := 1, value := 1 }],
    smoothness := SmoothClass.Cinfinity, isComplete := true, name := "(0, 1)" }

def nonCompleteGradient : VectorField :=
  let M := ManifoldSpec.euclideanSpace 1
  { manifold := M, components := [{ index := 0, value := 2 }],
    smoothness := SmoothClass.Cinfinity, isComplete := false, name := "grad(x^3)" }

def nonSmoothField : VectorField :=
  let M := ManifoldSpec.euclideanSpace 1
  { manifold := M, components := [{ index := 0, value := 1 }],
    smoothness := SmoothClass.C0, isComplete := false, name := "|x| d/dx" }

def nonUniqueField : VectorField :=
  let M := ManifoldSpec.euclideanSpace 1
  { manifold := M, components := [{ index := 0, value := 1 }],
    smoothness := SmoothClass.C0, isComplete := false, name := "sqrt|x| d/dx" }

#eval "== Examples.Counterexamples =="
#eval s!"Incomplete field: {incompleteFieldR.name}"
#eval s!"Non-Morse: {nonMorseSingularity.name}"
#eval s!"Non-involutive dist rank: {(nonInvolutiveDistribution : Distribution).rank}"
#eval s!"Center type: {(centerSingularity : VectorField).name}"
#eval "Module Examples.Counterexamples: COMPLETE"

end MiniVectorFieldsFlows
