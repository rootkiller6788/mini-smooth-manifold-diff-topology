import MiniDeRhamCohomology
open MiniDeRhamCohomology

#eval "══ Regression Tests: de Rham Invariants ══"
#eval "── χ(S¹) = 0 ──"
#eval eulerChar bettiS1 1
#eval "── χ(S²) = 2 ──"
#eval eulerChar bettiS2 2
#eval "── χ(T²) = 0 ──"
#eval eulerChar bettiT2 2
#eval "── χ(ℝℙ²) = 1 ──"
#eval eulerChar bettiRP2 2
#eval "── χ(ℂℙ²) = 3 ──"
#eval eulerChar bettiCP2 4
#eval "── Poincaré duality: b₀(S²)=b₂(S²)=1 ──"
#eval s!"b₀={bettiS2 0}, b₂={bettiS2 2}"
#eval "── Künneth: χ(S¹×S¹)=χ(S¹)·χ(S¹)=0 ──"
#eval s!"χ(S¹×S¹)={eulerChar (bettiProduct bettiS1 bettiS1) 2}"
