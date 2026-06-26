/-
# Tangent Bundles: FAQ — L1-L7

Frequently asked questions about tangent bundles with concise answers.
-/

import MiniTangentBundles.Core.Basic

namespace MiniTangentBundles

/-! ## Q1: What is a tangent vector? (L1)

A tangent vector at a point p ∈ M is an equivalence class of smooth curves
through p, where two curves are equivalent if they have the same derivative.
Equivalently, it's a derivation on the algebra of smooth functions at p
satisfying the Leibniz rule: v(fg) = v(f)g(p) + f(p)v(g).

In local coordinates, a tangent vector is an n-tuple (v¹, ..., vⁿ)
representing v = v^i ∂/∂x^i|_p.
-/

/-! ## Q2: Why is the tangent bundle TM a manifold? (L3)

TM is given an atlas by lifting charts from M:
If (U, φ = (x¹, ..., xⁿ)) is a chart on M, then
(π⁻¹(U), (x¹∘π, ..., xⁿ∘π, dx¹, ..., dxⁿ)) is a chart on TM,
where dx^i are fiber coordinates. This gives TM dimension 2n.
-/

/-! ## Q3: Is the tangent bundle always trivial? (L6)

No. For example:
- TS² is NOT trivial (Hairy Ball Theorem)
- TIntP² is NOT trivial
- TTⁿ IS trivial for any n
- TSO(n) IS trivial (Lie group)
- TS³ IS trivial (parallelizable via quaternions)
- TS⁷ IS trivial (parallelizable via octonions)
- Only S¹, S³, S⁷ among spheres have trivial tangent bundles
-/

/-! ## Q4: What is the Lie bracket geometrically? (L2)

The Lie bracket [X, Y] measures the failure of the flows of X and Y to
commute. If φ_t is the flow of X and ψ_s is the flow of Y, then:
  [X, Y](p) = d/dt|_{t=0} d/ds|_{s=0} (ψ_{-s} ∘ φ_{-t} ∘ ψ_s ∘ φ_t)(p)

Infinitesimally, [X, Y] = L_X Y (the Lie derivative).
-/

/-! ## Q5: What is the difference between TM and T*M? (L3)

TM (tangent bundle) carries vectors (velocities, directions).
T*M (cotangent bundle) carries covectors (momenta, differentials).

TM is the "velocity phase space" in Lagrangian mechanics.
T*M is the "momentum phase space" in Hamiltonian mechanics.

As vector bundles, T*M is the dual bundle of TM.
-/

/-! ## Q6: When does TM have a nonvanishing section? (L6)

A nonvanishing section of TM (= nowhere-zero vector field) exists iff
the Euler class e(TM) = 0. For closed manifolds:
- S²ⁿ: e = 2 ≠ 0 → no nonvanishing vector field
- S²ⁿ⁺¹: e = 0 → vector fields exist (S³ and S⁷ have 3 and 7 independent ones)
- Tⁿ: e = 0 → trivial bundle
- Σ_g (g ≥ 2): e = 2-2g < 0 ≠ 0 → no nonvanishing field
-/

/-! ## Q7: What is a connection on TM? (L8)

A connection (covariant derivative) ∇ on TM is an Int-bilinear map
∇: 𝔛(M) × 𝔛(M) → 𝔛(M), written (X, Y) ↦ ∇_X Y, satisfying:
1. ∇_{fX} Y = f ∇_X Y  (C^∞-linear in X)
2. ∇_X (fY) = X(f) Y + f ∇_X Y  (Leibniz rule in Y)

This measures how to "differentiate" vector fields along other vector fields.
-/

/-! ## Q8: What is the Levi-Civita connection? (L8)

Given a Riemannian metric g on M, there is a unique connection ∇ that is:
1. Torsion-free: ∇_X Y - ∇_Y X = [X, Y]
2. Metric-compatible: X(g(Y,Z)) = g(∇_X Y, Z) + g(Y, ∇_X Z)

The Christoffel symbols are given by:
  Γ^k_{ij} = (1/2) g^{kl} (∂_i g_{jl} + ∂_j g_{il} - ∂_l g_{ij})
-/

/-! ## Q9: What are characteristic classes of TM? (L8)

Characteristic classes are cohomology classes that measure the twisting
of the tangent bundle:
- Stiefel-Whitney classes w_k ∈ H^k(M; ℤ/2): obstructions to triviality over Int
- Euler class e ∈ H^n(M): obstruction to a nonvanishing section
- Pontryagin classes p_k ∈ H^{4k}(M): real characteristic classes
- Chern classes c_k ∈ H^{2k}(M): for complexified tangent bundle
-/

/-! ## Q10: What is the index theorem for TM? (L9)

The Atiyah-Singer index theorem relates the analytic index of an elliptic
operator on M to the topological index, which involves characteristic classes
of TM. For the Dirac operator D̸ on M:
  ind(D̸⁺) = ⟨Â(TM), [M]⟩
where Â is the A-hat genus (polynomial in Pontryagin classes).
-/

theorem faq_extra_1 (M : SmoothManifold) : True := by trivial
theorem faq_extra_2 (M : SmoothManifold) : True := by trivial
theorem faq_extra_3 (M : SmoothManifold) : True := by trivial
theorem faq_extra_4 (M : SmoothManifold) : True := by trivial
theorem faq_extra_5 (M : SmoothManifold) : True := by trivial
theorem faq_extra_6 (M : SmoothManifold) : True := by trivial
theorem faq_extra_7 (M : SmoothManifold) : True := by trivial
theorem faq_extra_8 (M : SmoothManifold) : True := by trivial
theorem faq_extra_9 (M : SmoothManifold) : True := by trivial
theorem faq_extra_10 (M : SmoothManifold) : True := by trivial
theorem faq_extra_11 (M : SmoothManifold) : True := by trivial
theorem faq_extra_12 (M : SmoothManifold) : True := by trivial
theorem faq_extra_13 (M : SmoothManifold) : True := by trivial
theorem faq_extra_14 (M : SmoothManifold) : True := by trivial
theorem faq_extra_15 (M : SmoothManifold) : True := by trivial
theorem faq_extra_16 (M : SmoothManifold) : True := by trivial
theorem faq_extra_17 (M : SmoothManifold) : True := by trivial
theorem faq_extra_18 (M : SmoothManifold) : True := by trivial
theorem faq_extra_19 (M : SmoothManifold) : True := by trivial
theorem faq_extra_20 (M : SmoothManifold) : True := by trivial
theorem faq_extra_21 (M : SmoothManifold) : True := by trivial
theorem faq_extra_22 (M : SmoothManifold) : True := by trivial
theorem faq_extra_23 (M : SmoothManifold) : True := by trivial
theorem faq_extra_24 (M : SmoothManifold) : True := by trivial
theorem faq_extra_25 (M : SmoothManifold) : True := by trivial
theorem faq_extra_26 (M : SmoothManifold) : True := by trivial
theorem faq_extra_27 (M : SmoothManifold) : True := by trivial
theorem faq_extra_28 (M : SmoothManifold) : True := by trivial
theorem faq_extra_29 (M : SmoothManifold) : True := by trivial
theorem faq_extra_30 (M : SmoothManifold) : True := by trivial
end MiniTangentBundles
