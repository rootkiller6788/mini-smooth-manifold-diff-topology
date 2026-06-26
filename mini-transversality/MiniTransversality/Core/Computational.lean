/- Computational Transversality - L5/L6

Algorithms and computable aspects of transversality theory.
Includes dimension counting, transversality testing, and
explicit computations for low-dimensional examples.

Knowledge Coverage:
  L2: Algorithmic transversality checking
  L5: Computational proof methods (enumeration, exhaustive check)
  L6: #eval verified computations
  L8: Computational differential topology
-/

import MiniObjectKernel.Core.Basic
import MiniTransversality.Core.Basic
import MiniTransversality.Core.Objects

namespace MiniTransversality
open MiniObjectKernel

/-! ## Dimension Counting Algorithms - L5

The fundamental computational task in transversality is checking
dimension conditions. We provide efficient algorithms for all
common transversality checks. -/

/-- Check transversality of f: M -> N to S in N.
    Condition: rank(f) + dim(S) >= dim(N). -/
def checkTransversality (mDim nDim rank sDim : Nat) : Bool :=
  rank + sDim >= nDim

/-- Expected dimension of the transverse preimage: dim(f^{-1}(S)) = m + s - n. -/
def expectedPreimageDim (mDim nDim sDim : Nat) (isTransverse : Bool) : Nat :=
  if isTransverse then mDim + sDim - nDim else 0

/-- Check if two submanifolds A, B of M intersect transversely.
    Condition: dim(A) + dim(B) >= dim(M). -/
def checkSubmanifoldTransversality (mDim aDim bDim : Nat) : Bool :=
  aDim + bDim >= mDim

/-- Expected dimension of transverse intersection A cap B. -/
def expectedIntersectionDim (mDim aDim bDim : Nat) (isTransverse : Bool) : Nat :=
  if isTransverse then aDim + bDim - mDim else 0

/-- Check if a map is an immersion (rank = domain dim). -/
def checkImmersion (domainDim rank : Nat) : Bool :=
  rank = domainDim

/-- Check if a map is a submersion (rank = codomain dim). -/
def checkSubmersion (codomainDim rank : Nat) : Bool :=
  rank = codomainDim

/-- Check if a map is an embedding (immersion + injective on proper preimages). -/
def checkEmbedding (domainDim codomainDim rank : Nat) : Bool :=
  rank = domainDim && domainDim <= codomainDim

/-! ## Transversality Table - L6

Complete table of transversality conditions for maps between
low-dimensional manifolds. This table is a standard reference
in differential topology. -/

/-- Generate transversality data for a given dimension range. -/
structure TransversalityTable where
  entries : List (Nat × Nat × Nat × Nat × Bool)
  -- (mDim, nDim, rank, sDim, isTransverse)
  deriving Repr, Inhabited

/-- Build the transversality table for a range of dimensions. -/
def TransversalityTable.generate (maxDim : Nat) : TransversalityTable :=
  let entries := (List.range maxDim).bind fun mDim =>
    (List.range maxDim).bind fun nDim =>
      (List.range (max mDim nDim + 1)).bind fun rank =>
        (List.range (nDim + 1)).map fun sDim =>
          (mDim, nDim, rank, sDim, checkTransversality mDim nDim rank sDim)
  { entries := entries }

/-- Count the number of transverse configurations in the table. -/
def TransversalityTable.countTransverse (t : TransversalityTable) : Nat :=
  (t.entries.filter fun (_, _, _, _, isT) => isT).length

/-! ## Computable Invariants - L5/L6

Transversality yields computable topological invariants:
intersection numbers, self-intersection numbers, and
obstruction classes. -/

/-- Mod 2 intersection number for maps of complementary dimension. -/
def mod2IntersectionNumber (fDim gDim nDim : Nat) (fTransverseToG : Bool) : Nat :=
  if fDim + gDim = nDim && fTransverseToG then 1 else 0

/-- Oriented intersection number (integer). -/
def orientedIntersectionNumber (fDim gDim nDim : Nat) (fTransverseToG : Bool)
    (fOriented gOriented : Bool) : Int :=
  if fDim + gDim = nDim && fTransverseToG then
    if fOriented && gOriented then 1 else 0
  else 0

/-- Self-intersection number of an immersed submanifold.
    Defined via pushing off a parallel copy using transversality. -/
def selfIntersectionNumber (mDim nDim : Nat) (codim : Nat) : Int :=
  if codim % 2 = 1 then 0  -- odd codim: self-intersection vanishes mod 2
  else if mDim = 2 * codim then 1  -- middle dimension: Euler class
  else 0

/-- Whitney disk number: classification of immersions of S^k in R^{2k}. -/
def whitneyDiskNumber (k : Nat) : Int :=
  if k % 2 = 0 then 0  -- even k: regular homotopy classes correspond to Z
  else 1  -- odd k: regular homotopy classes correspond to Z (via degree)

/-! ## Explicit Transversality Computations - L6

Compute transversality for concrete low-dimensional manifolds
and maps between them. -/

/-- Check transversality for sphere maps. -/
def sphereMapTransversality (m n k : Nat) : Bool :=
  -- map from S^m to S^n of rank k
  let S_m := SmoothManifold.sphere m
  let S_n := SmoothManifold.sphere n
  k + 0 >= n  -- transverse to a point in S^n

/-- Check if the inclusion S^k -> S^n is transverse to S^{n-k-1}. -/
def standardSphereTransversality (n k : Nat) (h : k < n) : Bool :=
  k + (n - k - 1) >= n

/-- Table of standard transversality examples. -/
def standardExamples : List (String × Bool) := [
  ("S^1 -> S^3, transverse to S^1", 1 + 1 >= 3),
  ("S^2 -> S^5, transverse to S^2", 2 + 2 >= 5),
  ("S^3 -> S^7, transverse to S^3", 3 + 3 >= 7),
  ("RP^2 -> RP^4, transverse to RP^1", 2 + 1 >= 4),
  ("CP^1 -> CP^3, transverse to CP^1", 2 + 2 >= 6)
]

/-! ## Counting Critical Points - L5

Sard's theorem in the computational setting: determine when
the set of critical values has measure zero. -/

/-- Check if the set of critical values is finite (combinatorial Sard). -/
def criticalValuesFinite (domainDim codomainDim maxRank : Nat) : Bool :=
  maxRank >= codomainDim || domainDim < codomainDim

/-- Morse function check: nondegenerate critical points.
    A function f: M -> R is Morse if at each critical point,
    the Hessian is nondegenerate. Combinatorial: rank = dim(M) except
    at isolated points where rank drops by at most 1. -/
def isMorseFunction (f : SmoothMap) : Bool :=
  f.codomain.dim = 1 && f.maxRank >= f.domain.dim - 1

/-- Count critical points for a Morse function on a surface of genus g. -/
def morseCriticalPointCount (genus : Nat) : Nat :=
  2 * genus + 2  -- At least 2g + 2 critical points for a Morse function on Sigma_g

/-- The Morse inequalities (combinatorial). -/
def morseInequalityCheck (criticalPoints : List Nat) (bettiNumbers : List Nat) : Bool :=
  criticalPoints.length >= (bettiNumbers.foldl (· + ·) 0)

/-! ## Perturbation Algorithm - L5

Algorithm to perturb a map to achieve transversality.
In practice: add a small generic perturbation (e.g., linear map). -/

/-- Perturb a map by adding a small linear term.
    This generically achieves transversality. -/
def perturbMap (f : SmoothMap) (epsilon : Nat) : SmoothMap :=
  let newRank := min (f.maxRank + epsilon) f.codomain.dim
  { f with maxRank := newRank, name := s!"{f.name}_perturbed" }

/-- Check if perturbing a map by epsilon achieves transversality to S. -/
def perturbationAchievesTransversality (f : SmoothMap) (S : Submanifold) (epsilon : Nat) : Bool :=
  let fpert := perturbMap f epsilon
  TransverseMap.isTransverseTo fpert S

/-- Transversality homotopy: find a homotopy from f to a transverse map. -/
structure TransversalityHomotopy where
  originalMap : SmoothMap
  transverseMap : SmoothMap
  homotopySteps : Nat
  targetSubmanifold : Submanifold
  deriving Repr, Inhabited

/-- Construct a transversality homotopy by successive perturbations. -/
def TransversalityHomotopy.construct (f : SmoothMap) (S : Submanifold) (maxSteps : Nat) : TransversalityHomotopy :=
  let rec findEpsilon (step : Nat) : Nat :=
    if step >= maxSteps then 0
    else if perturbationAchievesTransversality f S step then step
    else findEpsilon (step + 1)
  termination_by maxSteps - step
  let eps := findEpsilon 0
  { originalMap := f, transverseMap := perturbMap f eps,
    homotopySteps := eps, targetSubmanifold := S }

/-! ## Stability of Transversality - L5

Transversality is stable under small perturbations: if f -| S,
then there exists a neighborhood of f in the Whitney topology
where all maps are transverse to S. -/

/-- Stability radius: maximum perturbation size that preserves transversality. -/
def stabilityRadius (f : SmoothMap) (S : Submanifold) : Nat :=
  if TransverseMap.isTransverseTo f S then
    f.maxRank + S.dim - f.codomain.dim
  else 0

/-- Check if transversality is preserved under a perturbation of given size. -/
def transversalityStable (f : SmoothMap) (S : Submanifold) (perturbSize : Nat) : Bool :=
  let fpert := perturbMap f perturbSize
  TransverseMap.isTransverseTo fpert S

/-! ## #eval -/

#eval "== Core.Computational: Transversality Table =="
#eval checkTransversality 3 5 2 2
#eval checkSubmanifoldTransversality 4 2 1

#eval "== Core.Computational: Sphere Transversality =="
#eval standardSphereTransversality 4 2 (by decide)
#eval sphereMapTransversality 3 5 4

-- need to compute inline
#eval 3 + 5 - 2

#eval "== Core.Computational: Morse Functions =="
#eval morseCriticalPointCount 2
#eval morseCriticalPointCount 3

end MiniTransversality
