/-
# MiniDeRhamCohomology: Basic
De Rham cohomology theory in Lean 4. Knowledge: L1-L9.

This module covers de Rham cohomology for smooth manifolds:
differential forms, exterior derivative, cohomology groups,
Betti numbers, Euler characteristic, Poincare duality,
Kunneth formula, and applications.

Key references:
- Bott & Tu: Differential Forms in Algebraic Topology
- Warner: Foundations of Differentiable Manifolds

-/
import MiniDeRhamCohomology.Core.Basic
open MiniDeRhamCohomology

-- Helper: compute all Betti numbers for a given manifold
def allBetti (manifold : String) (maxDim : Nat) : List (Nat × Nat) :=
  (List.range (maxDim+1)).map (fun k => (k, bettiNumber manifold k))

-- Helper: total cohomology dimension (sum of all Betti numbers)
def cohomologyTotalDim (manifold : String) (maxDim : Nat) : Nat :=
  (List.range (maxDim+1)).foldl (fun acc k => acc + bettiNumber manifold k) 0

#eval "=========================================="
#eval "== Basic: Cohomology Data =="
#eval "=========================================="

#eval "--- S1 (circle) ---"
#eval s!"Betti: {allBetti "S1" 2}"
#eval s!"Euler: chi = {eulerChar bettiS1 1}"
#eval s!"Cohomology ring: H*(S1) = R[a]/(a^2), |a|=1"

#eval "--- S2 (sphere) ---"
#eval s!"Betti: {allBetti "S2" 2}"
#eval s!"Euler: chi = {eulerChar bettiS2 2}"
#eval s!"Cohomology ring: H*(S2) = R[a]/(a^2), |a|=2"

#eval "--- S3 (3-sphere) ---"
#eval s!"Betti: [{bettiS3 0},{bettiS3 1},{bettiS3 2},{bettiS3 3}]"
#eval s!"Euler: chi = {eulerChar bettiS3 3}"

#eval "--- T2 (torus) ---"
#eval s!"Betti: {allBetti "T2" 2}"
#eval s!"Euler: chi = {eulerChar bettiT2 2}"
#eval s!"Cohomology ring: H*(T2) = exterior algebra on 2 generators"

#eval "--- RP2 (real projective plane) ---"
#eval s!"Betti: {allBetti "RP2" 2}"
#eval s!"Euler: chi = {eulerChar bettiRP2 2}"
#eval s!"Note: H*(RP2;R) = R only (R coefficients)"

#eval "--- CP2 (complex projective plane) ---"
#eval s!"Betti: {allBetti "CP2" 4}"
#eval s!"Euler: chi = {eulerChar bettiCP2 4}"
#eval s!"Cohomology ring: H*(CP2) = R[x]/(x^3), |x|=2"

#eval "--- Kunneth formula ---"
#eval s!"S2 x S2: chi = {eulerChar bettiS2xS2 4}"
#eval s!"S1 x S2: chi = {eulerChar bettiS1xS2 3}"

#eval "--- Poincare duality ---"
#eval s!"S2: b0={bettiS2 0} = b2={bettiS2 2}"
#eval s!"S1: b0={bettiS1 0} = b1={bettiS1 1}"
#eval s!"T2: b0={bettiT2 0} = b2={bettiT2 2}, b1={bettiT2 1}"

#eval "--- Total dimensions ---"
#eval s!"dim H*(S1) = {cohomologyTotalDim "S1" 1}"
#eval s!"dim H*(S2) = {cohomologyTotalDim "S2" 2}"
#eval s!"dim H*(T2) = {cohomologyTotalDim "T2" 2}"
#eval s!"dim H*(CP2) = {cohomologyTotalDim "CP2" 4}"

#eval "--- Graded signs ---"
#eval s!"gs: {gradedSign 0},{gradedSign 1},{gradedSign 2},{gradedSign 3}"

#eval "=========================================="
#eval "== Basic: Complete =="
#eval "=========================================="
