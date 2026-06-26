/- Extended Morse Tables -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def extended_tables : List (String × String) := [
  ("Morse S0", "m0=2"),
  ("Morse S1", "m0=1,m1=1"),
  ("Morse S2", "m0=1,m2=1"),
  ("Morse S3", "m0=1,m3=1"),
  ("Morse Sn", "m0=1,mn=1"),
  ("Morse T2", "m0=1,m1=2,m2=1"),
  ("Morse RP2", "m0=1,m1=1,m2=1"),
  ("Morse RP3", "m0=1,m1=1,m3=1"),
  ("Morse CPn", "m{2k}=1"),
  ("Betti Sn", "b0=1,bn=1"),
  ("Betti T2", "b0=1,b1=2,b2=1"),
  ("Betti RPn(Z/2)", "bk=1 all k"),
  ("Betti CPn", "b{2k}=1"),
  ("chi(Sn)", "2 if n even, 0 if odd"),
  ("chi(RPn)", "1 if n even, 0 if odd"),
  ("chi(CPn)", "n+1"),
  ("Hdl decomp Sn", "0-handle + n-handle"),
  ("Hdl decomp T2", "0+2*1+2 handles"),
  ("Hdl decomp RP2", "0+1+2 handles"),
  ("Hdl decomp CPn", "0+2+...+2n handles"),
  ("Morse poly Sn", "1+tn"),
  ("Morse poly T2", "1+2t+t2"),
  ("Morse poly RP2", "1+t+t2"),
  ("Morse poly CPn", "1+t2+...+t{2n}"),
  ("Poincare Sn", "1+tn"),
  ("Poincare T2", "1+2t+t2"),
  ("Poincare CPn", "1+t2+...+t{2n}"),
]

#eval "== ExtendedTables =="
#eval extended_tables

end MiniSardMorse