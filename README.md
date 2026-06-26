# Mini Smooth Manifolds and Differential Topology

A collection of **from-scratch, zero-dependency Lean 4 implementations** of smooth manifold theory and differential topology. Each sub-module maps to MIT, Stanford, Berkeley, and other top-tier university courses, covering smooth manifolds, differential forms, de Rham cohomology, transversality, vector fields and flows, Sard/Morse theory, tangent bundles, and cobordism — all formalized in Lean 4.

## Sub-Modules

| Sub-Module | Topics | Key Courses |
|------------|--------|-------------|
| [mini-smooth-manifolds](mini-smooth-manifolds/) | Smooth manifolds — charts, atlases, smooth maps, partitions of unity, embeddings, submersions, immersions, submanifolds | MIT 18.901, Stanford MATH 215B, Berkeley MATH 214 |
| [mini-differential-forms](mini-differential-forms/) | Differential forms and exterior calculus — wedge product, exterior derivative, pullback, integration on manifolds, Stokes' theorem, characteristic classes | MIT 18.952, Stanford MATH 146 |
| [mini-de-rham-cohomology](mini-de-rham-cohomology/) | De Rham cohomology — cochain complex, exact/closed forms, Poincaré lemma, Mayer-Vietoris, Betti numbers, de Rham theorem | MIT 18.952, Cambridge Part III |
| [mini-tangent-bundles](mini-tangent-bundles/) | Tangent bundles and vector bundles — tangent vectors as derivations, bundle theory, frame bundles, connections, Riemannian metrics, geodesics | MIT 18.901 / MIT 18.950, Stanford MATH 215 |
| [mini-transversality](mini-transversality/) | Transversality theory — jet spaces, Thom transversality theorem, parametric transversality, stratified/equivariant transversality, intersection theory | MIT 18.966, Stanford MATH 215C, Berkeley MATH 214 |
| [mini-vector-fields-flows](mini-vector-fields-flows/) | Vector fields and flows — integral curves, Lie bracket, flow box theorem, Frobenius integrability theorem, Lie algebras | MIT 18.901, Stanford MATH 215B |
| [mini-sard-morse](mini-sard-morse/) | Sard's theorem and Morse theory — critical points, regular values, Sard's theorem, Morse functions, handle decompositions, Morse inequalities | MIT 18.901 / MIT 18.966, Stanford MATH 215C, Princeton MAT 560 |
| [mini-cobordism](mini-cobordism/) | Cobordism theory — cobordism groups, Pontryagin-Thom construction, h-cobordism theorem, surgery theory, exotic spheres, Thom spectra | MIT 18.905, Stanford MATH 215C, Berkeley Math 214 |

## Design Philosophy

- **Zero external dependencies** — pure Lean 4, only standard `lake` toolchain; no external libraries beyond the Lean core
- **Self-contained sub-modules** — each has its own `lakefile.lean`, `Main.lean`, `Core/`, `Theorems/`, `Properties/`, `Morphisms/`, `Constructions/`, `Bridges/`, `Advanced/`, `Test/`, and benchmark suite
- **Theory-to-code mapping** — every module provides inline references to textbook theorems (Guillemin-Pollack, Hirsch, Milnor, Bott-Tu) and lecture notes via `CourseAlignment.lean`
- **Full-spectrum formalization** — each sub-module treats the domain as a mathematical category: objects (Core), properties (Properties), morphisms (Morphisms), constructions (Constructions), theorems (Theorems), cross-domain bridges (Bridges), and advanced topics (Advanced)

## Building

Each sub-module is a standalone Lean 4 package. Build with `lake`:

```bash
cd mini-smooth-manifolds
lake build
```

Run smoke tests:

```bash
lake exe mini-smooth-manifolds
```

Requires **Lean 4** (elan/lake toolchain). See each sub-module's `README.md` for detailed course alignment and coverage reports.

## Project Structure

```
12. mini-smooth-manifold-diff-topology/
├── mini-smooth-manifolds/          # Smooth manifolds — charts, atlases, smooth maps, embeddings
├── mini-differential-forms/        # Differential forms — exterior algebra, Stokes, characteristic classes
├── mini-de-rham-cohomology/        # De Rham cohomology — chain complex, Poincaré lemma, Betti numbers
├── mini-tangent-bundles/           # Tangent bundles — vector bundles, connections, Riemannian metrics
├── mini-transversality/            # Transversality — Thom transversality, jet spaces, intersection theory
├── mini-vector-fields-flows/       # Vector fields — integral curves, Lie bracket, Frobenius theorem
├── mini-sard-morse/                # Sard/Morse — critical points, handle decompositions, Morse inequalities
├── mini-cobordism/                 # Cobordism — Pontryagin-Thom, h-cobordism, surgery, exotic spheres
├── lean-toolchain
├── .gitignore
├── README.md
└── README-CN.md
```

## License

MIT
