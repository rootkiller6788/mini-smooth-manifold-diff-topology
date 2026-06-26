/- Core Objects - L3 -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

structure MorseData where
  manifoldDim : Nat
  numCriticalPoints : Nat
  deriving Repr, Inhabited

def MorseData.ofFunction (f : MorseFunction) : MorseData :=
  { manifoldDim := f.manifold.dim
    numCriticalPoints := f.totalCriticalPoints }

structure CobordismGroup where
  dim : Nat
  groupName : String
  deriving Repr, Inhabited

def unorientedCobordismGroup (n : Nat) : String :=
  match n with
  | 0 => "Z/2Z" | 1 => "0" | 2 => "Z/2Z" | 3 => "0"
  | 4 => "Z/2Z x Z/2Z" | 5 => "Z/2Z" | 6 => "(Z/2Z)^3"
  | 7 => "Z/2Z" | _ => "unknown"

#eval "== Core.Objects =="
#eval unorientedCobordismGroup 0
#eval unorientedCobordismGroup 4

end MiniSardMorse