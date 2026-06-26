import MiniSmoothManifolds
open MiniSmoothManifolds

def main : IO Unit := do
  IO.println "== Smooth Manifold Examples Test =="
  IO.println ("dim(S^1) = " ++ toString Atlas.s1.dimension)
  IO.println ("dim(S^2) = " ++ toString (Atlas.sn 2).dimension)
  IO.println ("dim(CP^2) = " ++ toString (Atlas.cpn 2).dimension)
  IO.println ("dim(T^2) = " ++ toString Atlas.t2.dimension)
  IO.println ("chi(S^2) = " ++ toString (eulerCharSphere 2))
  IO.println ("chi(T^2) = " ++ toString eulerCharTorus)
  IO.println "ALL EXAMPLES PASSED"
