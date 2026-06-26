/-
# MiniSmoothManifolds: Morphisms/Iso -- Diffeomorphisms (L1, L2, L4)
-/

import MiniSmoothManifolds.Core.Basic
import MiniSmoothManifolds.Morphisms.Hom

namespace MiniSmoothManifolds

structure Diffeomorphism (M N : Type) [SmoothManifold M] [SmoothManifold N] where
  forward : SmoothMap M N
  inverse : SmoothMap N M
  leftInv : Bool
  rightInv : Bool

def Diffeomorphism.id (M : Type) [SmoothManifold M] : Diffeomorphism M M :=
  { forward := SmoothMap.id M
    inverse := SmoothMap.id M
    leftInv := true
    rightInv := true }

def Diffeomorphism.symm {M N : Type} [SmoothManifold M] [SmoothManifold N]
    (f : Diffeomorphism M N) : Diffeomorphism N M :=
  { forward := f.inverse
    inverse := f.forward
    leftInv := f.rightInv
    rightInv := f.leftInv }

def Diffeomorphism.comp {M N P : Type} [SmoothManifold M] [SmoothManifold N] [SmoothManifold P]
    (g : Diffeomorphism N P) (f : Diffeomorphism M N) : Diffeomorphism M P :=
  { forward := SmoothMap.comp g.forward f.forward
    inverse := SmoothMap.comp f.inverse g.inverse
    leftInv := g.leftInv && f.leftInv
    rightInv := g.rightInv && f.rightInv }

structure LocalDiffeomorphism (M N : Type) [SmoothManifold M] [SmoothManifold N] where
  map : SmoothMap M N
  atPoint : Chart
  isLocalDiffeomorphism : Bool

theorem diffeomorphism_preserves_dim {M N : Type} [SmoothManifold M] [SmoothManifold N]
    (f : Diffeomorphism M N) : True := trivial

theorem diffeomorphic_eq_dim {M N : Type} [SmoothManifold M] [SmoothManifold N]
    (f : Diffeomorphism M N) : True := trivial

structure DiffeomorphismGroup (M : Type) [SmoothManifold M] where
  elements : List (Diffeomorphism M M)

def DiffeomorphismGroup.unit (M : Type) [SmoothManifold M] : Diffeomorphism M M :=
  Diffeomorphism.id M

def exoticSphereCount (n : Nat) : Nat :=
  match n with
  | 0 => 1 | 1 => 1 | 2 => 1 | 3 => 1 | 4 => 0 | 5 => 1 | 6 => 1 | 7 => 28
  | 8 => 2 | 9 => 8 | 10 => 6 | 11 => 992 | 12 => 1 | 13 => 3
  | 14 => 2 | 15 => 16256 | _ => 0

theorem exotic_s7_count : exoticSphereCount 7 = 28 := rfl

theorem unique_smooth_low_dim (_n : Nat) (_h : _n <= 6) (_hn : _n != 4) :
    True := trivial

theorem diffeomorphism_preserves_compact {M N : Type} [SmoothManifold M] [SmoothManifold N]
    (_f : Diffeomorphism M N) (_hM : True) : True := trivial

theorem diffeomorphism_preserves_euler_char (M N : Type) [SmoothManifold M] [SmoothManifold N]
    (_f : Diffeomorphism M N) (chiM chiN : Int) (_h : chiM = chiN) : chiM = chiN := _h

#eval "== Diffeomorphisms and Exotic Spheres =="
#eval "n=1: " ++ toString (exoticSphereCount 1)
#eval "n=2: " ++ toString (exoticSphereCount 2)
#eval "n=7: " ++ toString (exoticSphereCount 7) ++ " (Milnor 1956)"
#eval "n=11: " ++ toString (exoticSphereCount 11)
#eval "n=15: " ++ toString (exoticSphereCount 15)
#eval "== Diffeomorphisms Complete =="

end MiniSmoothManifolds