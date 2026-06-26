import MiniDeRhamCohomology
open MiniDeRhamCohomology

#eval "══ Example Tests: de Rham Cohomology ══"
#eval "── H*(S¹) = (1, 1, 0) ──"
#eval s!"b₀={bettiS1 0}, b₁={bettiS1 1}, b₂={bettiS1 2}"
#eval "── H*(S²) = (1, 0, 1) ──"
#eval s!"b₀={bettiS2 0}, b₁={bettiS2 1}, b₂={bettiS2 2}"
#eval "── H*(T²) = (1, 2, 1) ──"
#eval s!"b₀={bettiT2 0}, b₁={bettiT2 1}, b₂={bettiT2 2}"
#eval "── H*(ℝℙ²) = (1, 0, 0) ──"
#eval s!"b₀={bettiRP2 0}, b₁={bettiRP2 1}, b₂={bettiRP2 2}"
#eval "── H*(ℂℙ²) = (1, 0, 1, 0, 1) ──"
#eval s!"b₀={bettiCP2 0}, b₁={bettiCP2 1}, b₂={bettiCP2 2}, b₃={bettiCP2 3}, b₄={bettiCP2 4}"
#eval "── Euler characteristic: χ(S²) = 2 ──"
#eval eulerChar bettiS2 2
#eval "── Euler characteristic: χ(T²) = 0 ──"
#eval eulerChar bettiT2 2
