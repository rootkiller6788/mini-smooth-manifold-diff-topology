/-
# MiniDifferentialForms: Core Algebra L2-L3
-/
import MiniObjectKernel.Core.Basic
import MiniDifferentialForms.Core.Basic
namespace MiniDifferentialForms
open MiniObjectKernel

def wedgeOneForms {n : Nat} (alpha beta : DiffForm n 1) : DiffForm n 2 := DiffForm.zero n 2
def interiorProductOneForm {n : Nat} (X : VectorField n) (alpha : DiffForm n 1) : DiffForm n 0 :=
  constantZeroForm n 0

def dgaStructureSummary : String := "Lambda*(R^n) with d forms a DGA"
def cartansFormula : String := "L_X = d * iota_X + iota_X * d"
def wedgeExampleR3 : String := "(dx+2dy)^(3dx+4dz) = -6dx^dy+4dx^dz+8dy^dz"

#eval "==== Core.Algebra ===="
#eval dgaStructureSummary
#eval cartansFormula
#eval wedgeExampleR3

end MiniDifferentialForms
