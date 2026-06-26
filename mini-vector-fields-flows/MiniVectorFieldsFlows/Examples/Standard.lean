/-
# MiniVectorFieldsFlows: Examples - Standard Examples (L6)
Gradient flows, Hamiltonian systems, and classical dynamical systems.
-/

import MiniObjectKernel.Core.Basic
import MiniVectorFieldsFlows.Core.Basic
import MiniVectorFieldsFlows.Core.Objects
import MiniVectorFieldsFlows.Core.Laws
import MiniVectorFieldsFlows.Theorems.Basic
import MiniVectorFieldsFlows.Theorems.Classification
import MiniVectorFieldsFlows.Properties.Invariants

namespace MiniVectorFieldsFlows
open MiniObjectKernel

def lotkaVolterra2D (alpha beta gamma delta : Int) : VectorField :=
  let M := ManifoldSpec.euclideanSpace 2
  { manifold := M, components := [{ index := 0, value := alpha }, { index := 1, value := delta }],
    smoothness := SmoothClass.Cinfinity, isComplete := true,
    name := s!"LV(alpha={alpha},beta={beta},gamma={gamma},delta={delta})" }

def lorenzSystem (sigma rho beta : Int) : VectorField :=
  let M := ManifoldSpec.euclideanSpace 3
  let comps := [{ index := 0, value := sigma }, { index := 1, value := rho }, { index := 2, value := beta }]
  { manifold := M, components := comps, smoothness := SmoothClass.Cinfinity,
    isComplete := true, name := s!"Lorenz(sigma={sigma},rho={rho},beta={beta})" }

def vanDerPol (mu : Int) : VectorField :=
  let M := ManifoldSpec.euclideanSpace 2
  { manifold := M, components := [{ index := 0, value := 1 }, { index := 1, value := mu }],
    smoothness := SmoothClass.Cinfinity, isComplete := true, name := s!"VanDerPol(mu={mu})" }

def duffingOscillator (alpha beta gamma delta : Int) : VectorField :=
  let M := ManifoldSpec.euclideanSpace 2
  { manifold := M, components := [{ index := 0, value := alpha }, { index := 1, value := delta }],
    smoothness := SmoothClass.Cinfinity, isComplete := true,
    name := s!"Duffing(alpha={alpha})" }

def simplePendulum (gL : Int) : VectorField :=
  let M := ManifoldSpec.euclideanSpace 2
  { manifold := M, components := [{ index := 0, value := 1 }, { index := 1, value := gL }],
    smoothness := SmoothClass.Cinfinity, isComplete := true, name := s!"Pendulum(g/L={gL})" }

def doublePendulumDim (n : Nat) : VectorField :=
  let M := ManifoldSpec.euclideanSpace n
  let comps := List.range n |>.map fun i => { index := i, value := 1 }
  { manifold := M, components := comps, smoothness := SmoothClass.Cinfinity,
    isComplete := true, name := "DoublePendulum" }

def magneticDipole : VectorField :=
  let M := ManifoldSpec.euclideanSpace 3
  { manifold := M, components := [{ index := 0, value := 1 }, { index := 1, value := 1 }, { index := 2, value := 1 }],
    smoothness := SmoothClass.Cinfinity, isComplete := true, name := "B_dipole" }

def geodesicFlow (M : ManifoldSpec) : VectorField :=
  let n := M.dim.n * 2
  let comps := List.range n |>.map fun i => { index := i, value := 1 }
  { manifold := { M with dim := { n := n } }, components := comps,
    smoothness := SmoothClass.Cinfinity, isComplete := true,
    name := s!"GeodesicFlow(M^{M.dim.n})" }

def reebVectorField (M : ManifoldSpec) : VectorField :=
  { manifold := M, components := [{ index := 0, value := 1 }],
    smoothness := SmoothClass.Cinfinity, isComplete := true, name := s!"Reeb(M^{M.dim.n})" }

def eulerRigidBody (I1 I2 I3 : Int) : VectorField :=
  let M := ManifoldSpec.euclideanSpace 3
  { manifold := M, components := [{ index := 0, value := I1 }, { index := 1, value := I2 }, { index := 2, value := I3 }],
    smoothness := SmoothClass.Cinfinity, isComplete := true,
    name := s!"EulerRB(I1={I1},I2={I2},I3={I3})" }

def navierStokesToy (Re : Int) : VectorField :=
  let M := ManifoldSpec.torus 3
  let comps := List.range 3 |>.map fun i => { index := i, value := Re }
  { manifold := M, components := comps, smoothness := SmoothClass.Cinfinity,
    isComplete := false, name := s!"NS(Re={Re})" }

def killingFieldSchwarzschild : VectorField :=
  let M := ManifoldSpec.euclideanSpace 4
  { manifold := M, components := [{ index := 0, value := 1 }],
    smoothness := SmoothClass.Cinfinity, isComplete := true, name := "d/dt (static)" }

/-! ## Examples - L6 -/

#eval "== Examples.Standard =="
#eval s!"S^2 manifold: {(ManifoldSpec.sphere 2).dim.n}"
#eval s!"Height gradient: {(VectorField.heightGradient 2).name}"
#eval s!"Hamiltonian: {(VectorField.hamiltonian 1 0).name}"
#eval s!"Classify: {classifyLinear2D 0 (-1)}"
#eval s!"LV: {(lotkaVolterra2D 2 1 1 1).name}"
#eval s!"Lorenz: {(lorenzSystem 10 28 2).name}"
#eval s!"VanDerPol: {(vanDerPol 5).name}"
#eval s!"Pendulum: {(simplePendulum 1).name}"
#eval s!"Geodesic flow on S^2: {(geodesicFlow (ManifoldSpec.sphere 2)).name}"
#eval s!"Reeb: {(reebVectorField (ManifoldSpec.sphere 3)).name}"
#eval s!"Euler: {(eulerRigidBody 1 2 3).name}"
#eval s!"NS Re=1000: {(navierStokesToy 1000).name}"
#eval "Module Examples.Standard: COMPLETE"

end MiniVectorFieldsFlows
