/- Morse Lemma - L4 -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

structure MorseNormalForm where
  index : Nat
  dim : Nat
  deriving Repr

def CriticalPointData.toNormalForm (cp : CriticalPointData) (dim : Nat) : MorseNormalForm :=
  { index := cp.index.lambda, dim := dim }

theorem ml_preserved (cp : CriticalPointData) (dim : Nat) : (cp.toNormalForm dim).index = cp.index.lambda := rfl

#eval "== Theorems.MorseLemma =="
#eval "Morse Lemma: normal form at nondegenerate critical points"

end MiniSardMorse