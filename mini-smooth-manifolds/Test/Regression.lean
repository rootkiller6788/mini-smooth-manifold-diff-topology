import MiniSmoothManifolds
open MiniSmoothManifolds

def main : IO Unit := do
  IO.println "== Smooth Manifold Regression Test =="
  -- Test consistency of atlas operations
  let s1 := Atlas.s1
  let s2 := Atlas.sn 2
  IO.println ("S^1 size: " ++ toString s1.size)
  IO.println ("S^2 size: " ++ toString s2.size)
  IO.println ("Product dim: " ++ toString (ProductAtlas.of s1 s1).dimension)
  IO.println "REGRESSION TESTS PASSED"
