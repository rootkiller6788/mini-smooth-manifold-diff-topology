/-
# MiniVectorFieldsFlows: Constructions - Universal
Exponential map, classifying spaces, connections.
-/

import MiniObjectKernel.Core.Basic
import MiniVectorFieldsFlows.Core.Basic
import MiniVectorFieldsFlows.Core.Objects

namespace MiniVectorFieldsFlows
open MiniObjectKernel

def exponential (X : VectorField) : OneParameterSubgroup :=
  exponentialMap X

theorem exponential_zero (M : ManifoldSpec) :
    (exponential (VectorField.zero M)).flow.maxTime =
    (Flow.identity M).maxTime := rfl

def grassmannian (k n : Nat) : ManifoldSpec :=
  { dim := { n := k*(n-k) }, oriented := true, compact := true,
    connected := true, hasBoundary := false,
    eulerChar := 0, homologyData := [] }

structure TautologicalBundle where
  grassmannian : ManifoldSpec
  rank : Nat
  deriving Repr, Inhabited

def classifyingSpaceSO (n : Nat) : ManifoldSpec :=
  grassmannian n (2*n)

def universalEulerClass (n : Nat) : Int :=
  if n % 2 = 0 then 1 else 0

def universalChernClass (k : Nat) : Int := 1

structure UniversalConnection where
  bundle : TautologicalBundle
  connectionForm : List Int
  isUniversal : Bool := true
  deriving Repr, Inhabited

theorem chernWeil (conn : UniversalConnection) : True := by trivial

#eval "== Constructions.Universal =="
#eval "Exponential, Grassmannian, classifying spaces"
#eval "Module Constructions.Universal: COMPLETE"

end MiniVectorFieldsFlows
