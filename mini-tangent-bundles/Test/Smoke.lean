import MiniTangentBundles

def main : IO Unit := do
  IO.println "=== mini-tangent-bundles Smoke Test ==="
  let M := MiniTangentBundles.sphereManifold
  IO.println s!"Sphere manifold dim: {M.dim}"
  IO.println s!"Point manifold dim: {MiniTangentBundles.pointManifold.dim}"
  IO.println s!"Circle manifold dim: {MiniTangentBundles.circleManifold.dim}"
  IO.println s!"Euler class S^2: {MiniTangentBundles.eulerClass M}"
  IO.println "All smoke tests passed!"
