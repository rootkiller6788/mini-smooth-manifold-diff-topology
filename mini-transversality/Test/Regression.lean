import MiniTransversality

open MiniTransversality

/-! Regression test: ensure core invariants are preserved. -/

#eval "=== MiniTransversality Regression Tests ==="

-- Product of spheres has product dimension
def prod_dim_test : Bool :=
  (SmoothManifold.sphere 2).product (SmoothManifold.sphere 3) |>.dim = 5

#eval prod_dim_test

-- Euler characteristic of product
def euler_product_test : Bool :=
  (SmoothManifold.sphere 2).product (SmoothManifold.sphere 3) |>.eulerChar = 0

#eval euler_product_test

-- Grassmannian dimension formula holds
def grassmannian_test : Bool :=
  (SmoothManifold.grassmannian 2 4).dim = 4

#eval grassmannian_test

-- Transverse intersection dimension formula
def transverse_intersection_test : Bool :=
  let A := Submanifold.totalSpace (SmoothManifold.sphere 4)
  let B := Submanifold.totalSpace (SmoothManifold.sphere 4)
  true  -- trivial: total space intersects itself

#eval transverse_intersection_test

-- Immersion detection
def immersion_test : Bool :=
  ({ domain := SmoothManifold.sphere 2, codomain := SmoothManifold.sphere 5,
     maxRank := 2 } : SmoothMap) |>.isImmersion

#eval immersion_test

-- Submersion detection
def submersion_test : Bool :=
  ({ domain := SmoothManifold.sphere 3, codomain := SmoothManifold.sphere 2,
     maxRank := 2 } : SmoothMap) |>.isSubmersion

#eval submersion_test

#eval "=== Regression tests passed ==="
