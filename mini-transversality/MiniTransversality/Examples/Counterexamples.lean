/- Counterexamples in Transversality - L6

Important non-examples and counterexamples that illustrate
the boundaries of transversality theory.

Knowledge Coverage:
  L6: Counterexamples with #eval verification
  L2: Understanding when transversality fails
  L8: Pathological cases
-/

import MiniObjectKernel.Core.Basic
import MiniTransversality.Core.Basic
import MiniTransversality.Core.Objects
import MiniTransversality.Core.Computational

namespace MiniTransversality
open MiniObjectKernel

/-! ## Counterexample 1: Tangent Intersection - L6

Two curves in R^2 that are tangent at their intersection point
are NOT transverse. Their tangent spaces coincide, so the sum
has dimension 1, not 2.
Example: y = x^2 and y = 0 at (0,0). -/

def tangent_curves_non_transverse : String :=
  "y=x^2 and y=0: tangent at (0,0), T=T=span(1,0), dim(sum)=1<2"

/-! ## Counterexample 2: Non-Regular Value - L6

The constant map f: S^1 -> R, f(x) = 0 has EVERY point as a
critical point. All values are critical, none are regular.
The preimage of 0 is S^1, which has dimension 1, NOT 1-1=0
as the regular value theorem would predict. -/

def constant_map_critical : String :=
  "f: S^1 -> R, f(x)=0: all values critical, preimage dim 1 != 0"

/-- Check: constant map is not transverse to a point. -/
def constantMapNotTransverse : Bool :=
  not (TransverseMap.isTransverseTo
    (SmoothMap.const (SmoothManifold.sphere 1) (SmoothManifold.closed 1 true 0 []))
    (Submanifold.point (SmoothManifold.closed 1 true 0 [])))

/-! ## Counterexample 3: Non-Transverse Sum - L6

Two submanifolds A, B in M with dim(A) + dim(B) < dim(M)
generically do not intersect. Even if they do, the intersection
is not transverse: the expected dimension dim(A)+dim(B)-dim(M)
is negative, which is impossible. -/

def negative_expected_dimension : String :=
  "A=S^1, B=S^1 in R^4: dim(A)+dim(B)=2 < 4, no transverse intersection"

/-- Verify: two circles in R^4 generically do not intersect. -/
def circlesInR4_notTransverse : Bool :=
  not (checkSubmanifoldTransversality 4 1 1)

/-! ## Counterexample 4: Non-Stable Singularity - L6

The map f(x,y) = (x, y^3 + xy) has an unstable singularity at (0,0)
(A_2 or cusp type). Under small perturbation, it splits into two
fold curves meeting at a cusp point (stable). -/

def unstable_cusp_splitting : String :=
  "f=(x, y^3+xy): A_2 unstable, perturbs to stable cusp + folds"

/-! ## Counterexample 5: Non-Transverse Family - L6

A family of maps F_t: M -> N may fail to be transversely
parametrized if F: I x M -> N is not transverse to S. Then
individual maps may fail to be transverse for isolated t. -/

def non_transverse_family_example : String :=
  "F(t,x) = x^2 - t: F not transverse to {0} in R, bad at t=0"

/-! ## Counterexample 6: Infinite Critical Values - L6

The function f(x) = x^2 sin(1/x) has infinitely many critical
points accumulating at 0. The set of critical values has 0
as a limit point, but still has measure zero (Sard holds!). -/

def sard_edge_case : String :=
  "x^2 sin(1/x): infinitely many critical pts, still Sard holds"

/-! ## Counterexample 7: Non-Transverse Manifold Pair - L6

In R^3, a line and a plane that contains the line are not transverse:
T(line) subset T(plane), sum has dim 2, not 3. Expected intersection
dim has no well-defined value. -/

def line_in_plane_non_transverse : String :=
  "Line in plane in R^3: T(line) subset T(plane), dim(sum)=2, not transverse"

/-! ## #eval -/

#eval "== Examples.Counterexamples =="
#eval constantMapNotTransverse
#eval circlesInR4_notTransverse
#eval tangent_curves_non_transverse
#eval line_in_plane_non_transverse

end MiniTransversality
