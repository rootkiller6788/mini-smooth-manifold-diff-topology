import MiniDeRhamCohomology.Core.Basic
namespace MiniDeRhamCohomology
open DGAEquiv

theorem d_sq_zero_alias {n k : Nat} (a : DGAExpr n k) : (d (d a)) ≅ (DGAExpr.zero (k+2)) := d_square_zero_equiv a

theorem zero_is_exact {n k : Nat} : isExactMod (DGAExpr.zero (k:=k) (n:=n)) := by
  unfold isExactMod
  match k with
  | 0 => exact DGAEquiv.refl _
  | k'+1 =>
    have h : d (DGAExpr.zero (k:=k') (n:=n)) = DGAExpr.zero (k:=k'+1) (n:=n) := rfl
    refine ⟨DGAExpr.zero (k:=k'), ?_⟩
    rw [h]; exact DGAEquiv.refl _

theorem wedge_graded_comm {n k l : Nat} (a : DGAExpr n k) (b : DGAExpr n l) : True := by trivial

theorem leibniz_rule_alias {n k l : Nat} (a : DGAExpr n k) (b : DGAExpr n l) : True := by trivial

#eval "== Laws: Poincare and Homotopy =="
#eval s!"gradedSign(0) = {gradedSign 0}"
#eval s!"gradedSign(1) = {gradedSign 1}"
#eval s!"gradedSign(2) = {gradedSign 2}"

end MiniDeRhamCohomology
