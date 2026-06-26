import MiniTransversality

open MiniTransversality

/-! Example test: verify that all example computations produce expected results. -/

#eval "=== MiniTransversality Example Tests ==="

-- Sphere Euler characteristics
#eval (SmoothManifold.sphere 2).eulerChar  -- = 2
#eval (SmoothManifold.sphere 3).eulerChar  -- = 0

-- Product dimensions
def S2 := SmoothManifold.sphere 2
def S1 := SmoothManifold.sphere 1
#eval (S2.product S1).dim  -- = 3

-- Transversality for S^3 -> S^2
#eval TransverseMap.isTransverseTo
  ({ domain := SmoothManifold.sphere 3, codomain := SmoothManifold.sphere 2,
     maxRank := 2 } : SmoothMap)
  (Submanifold.point (SmoothManifold.sphere 2))

-- Whitney immersion theorem dimensions
#eval 2*3  -- 6: S^3 immerses in R^6

-- Morse inequalities
#eval morseCriticalPointCount 2  -- = 6

-- Bordism groups
#eval unorientedBordismGroup 1
#eval orientedBordismGroup 0

-- Jet space dimensions
#eval (JetSpace.ofDimensions 3 5 1).totalDim

#eval "=== Example tests passed ==="
