import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def proofTechniques : List (String × String) := [
  ("Induction on cobordism constructors", "Prove properties by cases on the 7 constructors of the Cobordism inductive"),
  ("Handle decomposition", "Every cobordism can be decomposed into a sequence of handle attachments (Morse theory)"),
  ("Whitney trick", "In dimension >= 5, embedded spheres can be made disjoint by isotopy"),
  ("Handle cancellation", "Cancel complementary (k,k+1)-handles when attaching/belt spheres intersect once"),
  ("Surgery exact sequence", "Classify manifolds via normal invariants N(M) and L-group obstructions"),
  ("Adams spectral sequence", "Compute stable stems from Ext over Steenrod algebra"),
  ("Adams-Novikov SS", "Use MU_* MU Hopf algebroid to compute pi_*^S more efficiently"),
  ("Chromatic induction", "Prove nilpotence by descending chromatic filtration (Devinatz-Hopkins-Smith)"),
  ("Transversality", "Make maps transverse to submanifolds (parametrized version: Thom transversality)"),
  ("Pontryagin-Thom construction", "Collapse complement of embedded manifold to get map to Thom space")
]

def proofStrategyDetails : List (String × String) := [
  ("Cobordism equivalence", "refl: Mx[0,1]; symm: reverse; trans: glue along boundary"),
  ("O_n is abelian group", "Disjoint union: commutative, associative; empty = identity; -[M] = not always exists"),
  ("Thom theorem proof", "1. H^*(MO;F_2) = A (x)_{A(1)} F_2 as A-module"),
  ("", "2. A-module is free => polynomial algebra structure"),
  ("", "3. Generators correspond to indecomposables in H^*(MO)"),
  ("h-cobordism proof", "1. Choose Morse f: W -> [0,1]"),
  ("", "2. Critical points -> handles; order by index"),
  ("", "3. Cancel 0- and n-handles (connectedness)"),
  ("", "4. Cancel 1-handles using pi_1=0 for Whitney disks"),
  ("", "5. Cancel intermediate (k,k+1)-handles via Whitney trick"),
  ("", "6. Result: no handles => W = M x [0,1]")
]

#eval "== Proof Techniques =="
#eval proofTechniques
#eval proofStrategyDetails


end MiniCobordism
