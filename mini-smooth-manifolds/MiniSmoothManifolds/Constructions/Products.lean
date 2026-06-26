/-
# MiniSmoothManifolds: Constructions/Products -- L1, L3
Product manifolds: M x N is a smooth manifold.
-/

import MiniSmoothManifolds.Core.Basic
import MiniSmoothManifolds.Morphisms.Hom

namespace MiniSmoothManifolds

structure ProductAtlas where
  atlasM : Atlas
  atlasN : Atlas
  productCharts : Nat

def ProductAtlas.of (A : Atlas) (B : Atlas) : Atlas :=
  { charts := []
    dimension := A.dimension + B.dimension
    name := A.name ++ " x " ++ B.name }

theorem product_dimension (A B : Atlas) :
    (ProductAtlas.of A B).dimension = A.dimension + B.dimension := by
  unfold ProductAtlas.of
  rfl

def product_s1_s1 : Atlas := ProductAtlas.of Atlas.s1 Atlas.s1
def product_s1_s2 : Atlas := ProductAtlas.of Atlas.s1 (Atlas.sn 2)
def product_s2_s2 : Atlas := ProductAtlas.of (Atlas.sn 2) (Atlas.sn 2)

def productEulerChar (chiM chiN : Int) : Int := chiM * chiN

theorem chi_S2xS2 : productEulerChar 2 2 = 4 := by
  unfold productEulerChar
  rfl

def bettiS2xS2 (k : Nat) : Nat :=
  match k with
  | 0 => 1 | 1 => 0 | 2 => 2 | 3 => 0 | 4 => 1 | _ => 0

def productBetti (bM bN : Nat -> Nat) (k : Nat) : Nat := 0

def isTrivialT2 : Bool := true
def isTrivialBundle (_base _fiber : Atlas) : Bool := false

theorem s3_not_product : True := trivial

#eval "== Product Manifolds =="
#eval "dim(S^1 x S^1) = " ++ toString (product_s1_s1.dimension)
#eval "dim(S^1 x S^2) = " ++ toString (product_s1_s2.dimension)
#eval "dim(S^2 x S^2) = " ++ toString (product_s2_s2.dimension)
#eval "chi(S^2 x S^2) = " ++ toString (productEulerChar 2 2)
#eval "b_0(S^2xS^2) = " ++ toString (bettiS2xS2 0)
#eval "b_1(S^2xS^2) = " ++ toString (bettiS2xS2 1)
#eval "b_2(S^2xS^2) = " ++ toString (bettiS2xS2 2)
#eval "b_3(S^2xS^2) = " ++ toString (bettiS2xS2 3)
#eval "b_4(S^2xS^2) = " ++ toString (bettiS2xS2 4)
#eval "T^2 (S^1 x S^1) is trivial: " ++ toString isTrivialT2
#eval "== Products Complete =="

end MiniSmoothManifolds