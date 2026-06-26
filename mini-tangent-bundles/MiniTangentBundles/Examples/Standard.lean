import MiniTangentBundles.Core.Basic
namespace MiniTangentBundles

-- S1 trivial tangent bundle example
def circleNonvanishingVF : VectorField circleManifold := fun p i => (1 : Int)

-- T2 independent vector fields
def T2_manifold' : SmoothManifold := torus 2
def T2_vectorField1 : VectorField T2_manifold' := fun p i => if i.val = 0 then (1 : Int) else (0 : Int)
def T2_vectorField2 : VectorField T2_manifold' := fun p i => if i.val = 1 then (1 : Int) else (0 : Int)

end MiniTangentBundles
