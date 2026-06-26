/- Morse Inequalities - L4 -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def check_weak_morse (f : MorseFunction) (k : Nat) : Bool := f.weakMorseInequality k

#eval "== Theorems.MorseInequalities =="
#eval s!"Weak Morse T2: {check_weak_morse MorseFunction.heightOnTorus 0}"

end MiniSardMorse