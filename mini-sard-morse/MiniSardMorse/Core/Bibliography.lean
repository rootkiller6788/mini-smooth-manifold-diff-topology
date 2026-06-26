/- Bibliography -/
import MiniObjectKernel.Core.Basic
import MiniSardMorse.Core.Basic

namespace MiniSardMorse
open MiniObjectKernel

def bibliography : List (String × String) := [
  ("Milnor, J.", "Morse Theory. Annals of Math Studies 51, Princeton UP (1963)"),
  ("Sard, A.", "The measure of the critical values of differentiable maps. Bull. AMS 48 (1942)"),
  ("Smale, S.", "Generalized Poincare conjecture in dimensions > 4. Ann. Math 74 (1961)"),
  ("Bott, R.", "Lectures on Morse theory, old and new. Bull. AMS 7 (1982)"),
  ("Witten, E.", "Supersymmetry and Morse theory. J. Diff. Geom. 17 (1982)"),
  ("Floer, A.", "Morse theory for Lagrangian intersections. J. Diff. Geom. 28 (1988)"),
  ("Banyaga, A.; Hurtubise, D.", "Lectures on Morse Homology. Kluwer (2004)"),
  ("Nicolaescu, L.", "An Invitation to Morse Theory. Springer (2011)"),
  ("Audin, M.; Damian, M.", "Morse Theory and Floer Homology. Springer (2014)"),
  ("Schwarz, M.", "Morse Homology. Birkhauser (1993)"),
  ("Cohen, R.; Jones, J.; Segal, G.", "Floer's infinite-dimensional Morse theory. IHES (1995)"),
  ("Hutchings, M.", "Lecture Notes on Morse Homology. UC Berkeley (2002)"),
  ("Matsumoto, Y.", "An Introduction to Morse Theory. AMS (2002)"),
  ("Forman, R.", "Morse theory for cell complexes. Adv. Math. 134 (1998)"),
  ("Kashiwara, M.; Schapira, P.", "Sheaves on Manifolds. Springer (1990)"),
]

#eval "== Bibliography =="
#eval bibliography

end MiniSardMorse