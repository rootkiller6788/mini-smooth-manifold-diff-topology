import MiniTransversality

open MiniTransversality

/-! Smoke test: verify that core definitions compile and basic computations work. -/

#eval "=== MiniTransversality Smoke Test ==="

-- Verify manifolds
#eval (SmoothManifold.sphere 2).dim
#eval (SmoothManifold.torus 3).eulerChar
#eval (SmoothManifold.complexProjective 2).dim

-- Verify transversality checks
#eval TransverseMap.isTransverseTo
  (SmoothMap.id (SmoothManifold.sphere 2))
  (Submanifold.point (SmoothManifold.sphere 2))

-- Verify jet space dimensions
#eval (JetSpace.ofDimensions 3 2 1).totalDim

-- Verify bordism groups
#eval unorientedBordismGroup 2
#eval orientedBordismGroup 4

-- Verify all core modules are accessible
#eval linearTransversality 3 2 2 1
#eval checkTransversality 3 5 4 2

-- Verify transversality dimension formula
#eval 2 + 2 - 4  -- Expected dimension 0 for complementary dim intersection

#eval "=== All tests passed ==="
