/-
# MiniDifferentialForms: Core Definitions L1-L3
-/
import MiniObjectKernel.Core.Basic
namespace MiniDifferentialForms
open MiniObjectKernel

structure DiffForm (n k : Nat) where coeff : (Fin n) -> Int deriving Inhabited
instance : Object (DiffForm n k) where
  theory := TheoryName.ofString "DifferentialTopology.DifferentialForms"
  objName := s!"Omega^{k}(R^{n})"
  repr _ := s!"Omega^{k}(R^{n})"

def DiffForm.zero (n k : Nat) : DiffForm n k := { coeff := fun _ => 0 }
def DiffForm.smul (c : Int) (omega : DiffForm n k) : DiffForm n k := { coeff := fun f => c * omega.coeff f }
def DiffForm.add (omega eta : DiffForm n k) : DiffForm n k := { coeff := fun f => omega.coeff f + eta.coeff f }
def DiffForm.neg (omega : DiffForm n k) : DiffForm n k := { coeff := fun f => -omega.coeff f }
def DiffForm.equal (omega eta : DiffForm n k) : Prop := forall f, omega.coeff f = eta.coeff f

def ZeroForm (n : Nat) : Type := Fin n -> Int
def OneForm (n : Nat) : Type := Fin n -> Int
def constantZeroForm (n : Nat) (c : Int) : DiffForm n 0 := { coeff := fun _ => c }
def basisOneForm (n : Nat) (i : Fin n) : DiffForm n 1 := { coeff := fun j => if j = i then 1 else 0 }

def dimOfKForms (n k : Nat) : Nat :=
  match n, k with
  | _, 0 => 1
  | 0, _+1 => 0
  | n+1, k+1 => dimOfKForms n (k+1) + dimOfKForms n k

def gradedSign (k l : Nat) : Int := if (k * l) % 2 = 0 then 1 else -1

def VectorField (n : Nat) : Type := Fin n -> Int
def VectorField.zero (n : Nat) : VectorField n := fun _ => 0

def LinearMap (m n : Nat) : Type := Fin m -> Fin n -> Int
def LinearMap.id (n : Nat) : LinearMap n n := fun i j => if i = j then 1 else 0

#eval "==== Core.Basic L1-L3 ===="
#eval s!"dim O0(R3)={dimOfKForms 3 0}"
#eval s!"dim O1(R3)={dimOfKForms 3 1}"
#eval s!"dim O2(R3)={dimOfKForms 3 2}"
#eval s!"dim O3(R3)={dimOfKForms 3 3}"
#eval s!"gSign(1,1)={gradedSign 1 1}"

end MiniDifferentialForms
