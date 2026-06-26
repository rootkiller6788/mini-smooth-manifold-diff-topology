import MiniTangentBundles.Core.Basic
namespace MiniTangentBundles

def TangentSpace.normSq {M : SmoothManifold} {p : Point M} (v : TangentSpace M p) : Int := 0
def TangentSpace.isParallel {M : SmoothManifold} {p : Point M} (v w : TangentSpace M p) : Bool := false
def TangentSpace.norm {M : SmoothManifold} {p : Point M} (v : TangentSpace M p) : Int := 0

def TangentBundle.sameFiber {M : SmoothManifold} (x y : TangentBundle M) : Bool := x.1 = y.1
def TangentBundle.fiberAdd {M : SmoothManifold} (x y : TangentBundle M) (_h : x.1 = y.1) : TangentBundle M :=
  TangentBundle.mk x.1 (TangentSpace.add x.2 y.2)
def TangentBundle.fiberSmul {M : SmoothManifold} (r : Int) (x : TangentBundle M) : TangentBundle M :=
  TangentBundle.mk x.1 (TangentSpace.smul r x.2)

def VectorField.eval {M : SmoothManifold} (X : VectorField M) (p : Point M) (i : Fin M.dim) : Int := X p i
def VectorField.dotVF {M : SmoothManifold} (X Y : VectorField M) : Point M -> Int := fun _ => 0
def VectorField.normVF {M : SmoothManifold} (X : VectorField M) : Point M -> Int := fun _ => 0
def VectorField.isZeroAt {M : SmoothManifold} (X : VectorField M) (p : Point M) : Bool := false
def VectorField.zeroCount {M : SmoothManifold} (_X : VectorField M) : Nat := 0

def pt0 : Point sphereManifold := ⟨0, by decide⟩
def pt1 : Point circleManifold := ⟨0, by decide⟩

def exampleVector : TangentSpace sphereManifold pt0 := fun i =>
  if i.val = 0 then (3 : Int) else if i.val = 1 then (4 : Int) else (0 : Int)

#eval TangentSpace.normSq exampleVector
#eval TangentSpace.dot exampleVector exampleVector

def circleVectorField : VectorField circleManifold := fun _p _i => (1 : Int)
def idx0 : Fin (circleManifold.dim) := ⟨0, by decide⟩
#eval VectorField.eval circleVectorField pt1 idx0

end MiniTangentBundles
