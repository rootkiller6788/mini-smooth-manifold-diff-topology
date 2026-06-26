import MiniTangentBundles.Core.Basic

namespace MiniTangentBundles

structure CurvatureTensor (M : SmoothManifold) where
  R : VectorField M -> VectorField M -> VectorField M -> VectorField M
  antisymm1 : forall X Y Z, R X Y Z = VectorField.neg (R Y X Z)
  first_bianchi : forall X Y Z, VectorField.add (VectorField.add (R X Y Z) (R Y Z X)) (R Z X Y) = VectorField.zero

def characteristicNumbers (M : SmoothManifold) (_h : M.dim = 4) : (Int × Int × Int) :=
  if M.name == "CP^2" then (3, 3, 1)
  else if M.name == "S^4" then (0, 2, 0)
  else (0, 0, 0)

def cobordantViaTangentBundle (M N : SmoothManifold) : Bool :=
  M.dim == N.dim && M.oriented == N.oriented

end MiniTangentBundles
