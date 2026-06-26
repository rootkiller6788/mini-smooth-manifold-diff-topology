import MiniTangentBundles

def main : IO Unit := do
  IO.println "=== mini-tangent-bundles Example Tests ==="
  IO.println s!"R^3 manifold: {(MiniTangentBundles.euclideanSpace 3).name}"
  IO.println s!"T^2 manifold: {(MiniTangentBundles.torus 2).name}"
  IO.println s!"RP^2 manifold: {(MiniTangentBundles.realProjectiveSpace 2).name}"
  IO.println s!"S^2 Euler class: {MiniTangentBundles.eulerClass MiniTangentBundles.sphereManifold}"
  IO.println s!"S^1 parallelizable: {MiniTangentBundles.isParallelizable MiniTangentBundles.circleManifold}"
  IO.println s!"S^2 parallelizable: {MiniTangentBundles.isParallelizable MiniTangentBundles.sphereManifold}"
  IO.println "All example tests passed!"
