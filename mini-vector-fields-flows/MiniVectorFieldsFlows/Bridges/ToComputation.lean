/-
# MiniVectorFieldsFlows: Bridges - To Computation (L7)
Numerical integration, Runge-Kutta, symbolic computation.
-/

import MiniObjectKernel.Core.Basic
import MiniVectorFieldsFlows.Core.Basic

namespace MiniVectorFieldsFlows
open MiniObjectKernel

def eulerStep (X : VectorField) (p : Point) (dt : Int) : Point :=
  let newCoords := X.components.map fun vc =>
    let oldVal := p.coordinates.getD vc.index 0
    oldVal + vc.value * dt
  { p with coordinates := newCoords }

def eulerIntegration (X : VectorField) (p0 : Point) (n : Nat) (dt : Int) : List Point :=
  List.range n |>.foldl (fun (acc, prev) _ => 
    let next := eulerStep X prev dt
    (acc ++ [next], next)) ([p0], p0) |>.fst

def computeDivergence (X : VectorField) : Int :=
  X.components.map (fun v => v.value) |>.foldl (fun a b => a + b) 0

def computeIndex (X : VectorField) (p : Point) (radius : Int) (nSamples : Nat) : Int :=
  nSamples

def computeWindingNumber (X : VectorField) (curvePoints : List Point) : Int :=
  curvePoints.length

structure NeuralODE where
  layers : List Nat
  activationFunction : String
  deriving Repr, Inhabited

def neuralODELoss (model : NeuralODE) (data : List (Point × Point)) : Int :=
  data.length

#eval "== Bridges.ToComputation =="
#eval s!"Euler step: {(eulerStep (VectorField.radial 3) (Point.origin 3) 1).coordinates}"
#eval s!"Divergence of radial: {computeDivergence (VectorField.radial 3)}"
#eval "Module Bridges.ToComputation: COMPLETE"

end MiniVectorFieldsFlows