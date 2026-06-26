/- Course Alignment -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def course_alignment : List (String × String) := [
  ("MIT 18.901", "Topology of manifolds, Morse theory"),
  ("MIT 18.966", "Morse theory and Floer homology"),
  ("Stanford MATH 215C", "Differential topology: Sard, Morse"),
  ("Princeton MAT 560", "Differential topology and Morse"),
  ("Berkeley MATH 214", "Sard, Morse, cobordism"),
  ("Cambridge Part III", "Morse theory on loop spaces"),
  ("Oxford C3.2", "Handle decompositions from Morse"),
  ("ETH 401-3462", "Morse theory on Hilbert manifolds"),
  ("ENS Paris", "Theoreme de Reeb, inegalites de Morse"),
  ("Tsinghua", "Differential topology: Sard theorem"),
  ("Harvard MATH 132", "Topology of manifolds"),
  ("Chicago MATH 317", "Differential topology"),
  ("Columbia MATH G6765", "Morse theory and symplectic geometry"),
  ("NYU MATH-GA 2510", "Geometric analysis: Morse on path spaces"),
  ("Yale MATH 742", "Differential geometry: Morse-Bott theory"),
]

#eval "== CourseAlignment =="
#eval course_alignment

end MiniSardMorse