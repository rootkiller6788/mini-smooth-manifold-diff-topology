import MiniTangentBundles.Core.Basic
namespace MiniTangentBundles

def eulerClass (M : SmoothManifold) : Int :=
  if M.dim % 2 = 0 then 2 else 0

#eval eulerClass sphereManifold

def S3_manifold : SmoothManifold :=
  { dim := 3, pointCount := 32, oriented := true,
    compact := true, connected := true, hasBoundary := false, name := "S^3" }

#eval eulerClass S3_manifold

def isParallelizable (M : SmoothManifold) : Bool :=
  M.name = "S^1" || M.name = "S^3" || M.name = "S^7"

#eval isParallelizable S3_manifold
#eval isParallelizable circleManifold
#eval isParallelizable sphereManifold

end MiniTangentBundles
