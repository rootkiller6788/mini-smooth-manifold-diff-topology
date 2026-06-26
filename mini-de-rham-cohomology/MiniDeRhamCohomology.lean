/-
# MiniDeRhamCohomology

De Rham cohomology theory in Lean 4: differential forms,
exterior derivative, cohomology groups, and the fundamental
theorems (d²=0, Poincaré lemma, de Rham theorem).

## Sub-packages
- Core         — DGAExpr, d, DGAEquiv, d²=0 proof
- Morphisms    — Chain maps, pullbacks, homotopy operators
- Constructions — Products, quotients, subs, universal properties
- Properties   — Invariants, preservation, classification data
- Theorems     — Poincaré lemma, Stokes, de Rham theorem, Hodge
- Examples     — Standard manifolds: S¹, S², T², ℝℙ², ℂℙ²
- Bridges      — Algebra, topology, geometry, computation
- Advanced     — Hodge theory, spectral sequences
-/
import MiniDeRhamCohomology.Core.All
import MiniDeRhamCohomology.Morphisms.All
import MiniDeRhamCohomology.Constructions.All
import MiniDeRhamCohomology.Properties.All
import MiniDeRhamCohomology.Theorems.All
import MiniDeRhamCohomology.Examples.All
import MiniDeRhamCohomology.Bridges.All
import MiniDeRhamCohomology.Advanced.All
