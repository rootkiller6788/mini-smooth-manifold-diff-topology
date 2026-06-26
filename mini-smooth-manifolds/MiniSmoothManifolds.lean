/-
# MiniSmoothManifolds

Smooth manifold theory in Lean 4: charts, atlases, smooth maps,
diffeomorphisms, submanifolds, product/quotient constructions,
and fundamental theorems (inverse function, implicit function,
Whitney embedding, Sard).

## Sub-packages
- Core         — Chart, Atlas, SmoothManifold, SmoothStructure
- Morphisms    — SmoothMap, Diffeomorphism, Immersion, Submersion
- Constructions — Products, Submanifolds, Quotients, Universal
- Properties   — Invariants (dimension, orientability, etc.)
- Theorems     — Inverse function, Implicit function, Rank, Whitney, Sard
- Examples     — S^n, RP^n, CP^n, T^n, Lie groups, Grassmannians
- Bridges      — ToAlgebra, ToTopology, ToGeometry, ToComputation
- Advanced     — Infinite-dimensional, Banach, Fréchet manifolds
-/
import MiniSmoothManifolds.Core.All
import MiniSmoothManifolds.Morphisms.All
import MiniSmoothManifolds.Constructions.All
import MiniSmoothManifolds.Properties.All
import MiniSmoothManifolds.Theorems.All
import MiniSmoothManifolds.Examples.All
import MiniSmoothManifolds.Bridges.All
import MiniSmoothManifolds.Advanced.All
