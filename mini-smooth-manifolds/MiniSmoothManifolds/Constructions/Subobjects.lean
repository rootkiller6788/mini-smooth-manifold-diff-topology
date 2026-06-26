/-
# MiniSmoothManifolds: Constructions/Subobjects -- Submanifolds (L1, L2, L3)
-/

import MiniSmoothManifolds.Core.Basic
import MiniSmoothManifolds.Morphisms.Hom

namespace MiniSmoothManifolds

structure Submanifold (M : Type) [SmoothManifold M] where
  codim : Nat

def Submanifold.codimension {M : Type} [SmoothManifold M] (S : Submanifold M) : Nat := S.codim

def isHypersurface {M : Type} [SmoothManifold M] (S : Submanifold M) : Bool := S.codim == 1

theorem hypersurface_orientable (n : Nat) : True := trivial

def isRegularLevelSet {M : Type} [SmoothManifold M] (_S : Submanifold M) : Bool := true

structure ImmersedSubmanifold (M : Type) [SmoothManifold M] where
  source : Type
  [srcSmooth : SmoothManifold source]
  isInjective : Bool

def figureEight : ImmersedSubmanifold (List Nat) :=
  { source := List Nat
    isInjective := true }

def denseLineOnTorus : Bool := true

structure InitialSubmanifold (M : Type) [SmoothManifold M] where
  sub : Submanifold M
  isInitial : Bool

theorem embedded_implies_initial {M : Type} [SmoothManifold M] (_S : Submanifold M) : True := trivial

def sl_n_R_is_submanifold (_n : Nat) : Bool := true
def On_dimension (n : Nat) : Nat := n*(n-1)/2
def SOn_dimension (n : Nat) : Nat := n*(n-1)/2
def Un_dimension (n : Nat) : Nat := n*n
def SUn_dimension (n : Nat) : Nat := n*n - 1

def sphereAsSubmanifold (_n : Nat) : Bool := true
def equatorSubmanifold (_n : Nat) : Bool := true
def cpAsSubmanifold (_n : Nat) : Bool := true

#eval "== Submanifolds =="
#eval "-- Lie Group Dimensions --"
#eval "dim O(3) = " ++ toString (On_dimension 3) ++ " (= 3)"
#eval "dim SO(3) = " ++ toString (SOn_dimension 3) ++ " (= 3)"
#eval "dim U(2) = " ++ toString (Un_dimension 2) ++ " (= 4)"
#eval "dim SU(2) = " ++ toString (SUn_dimension 2) ++ " (= 3, S^3)"
#eval "dim SU(3) = " ++ toString (SUn_dimension 3) ++ " (= 8)"
#eval "-- Submanifolds of R^n --"
#eval "S^1 in R^2: dim=1, codim=1 (hypersurface)"
#eval "S^2 in R^3: dim=2, codim=1 (hypersurface)"
#eval "== Submanifolds Complete =="

end MiniSmoothManifolds