# mini-de-rham-cohomology — De Rham Cohomology Theory

A Lean 4 implementation of de Rham cohomology theory for smooth manifolds,
covering differential forms, exterior derivative, cohomology groups,
Betti numbers, Euler characteristic, and fundamental theorems.

## Module Status: COMPLETE

- **L1 Definitions**: Complete — DGAExpr, DiffForm, DeRhamCohomology, DGAEquiv
- **L2 Core Concepts**: Complete — Closed/exact forms, cohomology class, Euler characteristic
- **L3 Math Structures**: Complete — de Rham complex (d²=0), cohomology ring, Betti numbers
- **L4 Fundamental Theorems**: Complete — d²=0 proof, Poincaré lemma, Leibniz rule
- **L5 Proof Techniques**: Complete — Structural induction, algebraic relations, graded sign computation (>=3 methods)
- **L6 Canonical Examples**: Complete — S¹, S², S³, T², RP², CP², products with #eval verification
- **L7 Applications**: Complete — Chern-Weil, gauge theory, symplectic geometry (>=2 applications)
- **L8 Advanced Topics**: Complete — Hodge theory, spectral sequences, rational homotopy, formality
- **L9 Research Frontiers**: Partial — Derived de Rham, p-adic Hodge, elliptic cohomology (documented)

## Quick Start

```bash
cd mini-de-rham-cohomology
lake build
lake env lean --run Test/Smoke.lean
```

## Key Verifications

| Manifold | Betti numbers | Euler χ |
|----------|--------------|---------|
| S¹ | (1, 1) | 0 |
| S² | (1, 0, 1) | 2 |
| T² | (1, 2, 1) | 0 |
| RP² | (1, 0, 0) | 1 |
| CP² | (1, 0, 1, 0, 1) | 3 |

## Structure

| Layer | Description |
|-------|-------------|
| Core | DGAExpr, d, DGAEquiv, d²=0, Betti numbers |
| Morphisms | Chain maps, pullbacks, homotopy |
| Constructions | Products, quotients, subobjects |
| Properties | Invariants, preservation, classification |
| Theorems | Poincaré lemma, Stokes, de Rham theorem |
| Examples | S¹, S², T², RP², CP² computations |
| Bridges | Algebra, topology, geometry, computation |
| Advanced | Hodge theory, spectral sequences |

## Dependencies

- `mini-object-kernel` — TheoryName, Object typeclass
