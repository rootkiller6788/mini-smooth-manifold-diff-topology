/- Handle Attachment - L3 -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

structure HandleAttachment where
  baseManifold : SmoothManifold
  handleIndex : Nat
  resultingEuler : Int
  deriving Repr

def HandleAttachment.create (M : SmoothManifold) (k : Nat) : HandleAttachment :=
  { baseManifold := M, handleIndex := k, resultingEuler := 0 }

#eval "== HandleAttachment =="
#eval "S2 + 0-handle attached"

end MiniSardMorse