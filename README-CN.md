# 迷你光滑流形与微分拓扑

一套**从零开始、零依赖的 Lean 4 实现**，涵盖光滑流形理论与微分拓扑。每个子模块均对标 MIT、Stanford、Berkeley 等顶尖大学课程，覆盖光滑流形、微分形式、de Rham 上同调、横截性、向量场与流、Sard/Morse 理论、切丛及配边理论——全部以 Lean 4 形式化。

## 子模块

| 子模块 | 主题 | 对标课程 |
|--------|------|----------|
| [mini-smooth-manifolds](mini-smooth-manifolds/) | 光滑流形 — 坐标卡、图册、光滑映射、单位分解、嵌入、淹没、浸入、子流形 | MIT 18.901, Stanford MATH 215B, Berkeley MATH 214 |
| [mini-differential-forms](mini-differential-forms/) | 微分形式与外微分 — 楔积、外导数、拉回、流形上的积分、Stokes 定理、示性类 | MIT 18.952, Stanford MATH 146 |
| [mini-de-rham-cohomology](mini-de-rham-cohomology/) | de Rham 上同调 — 上链复形、恰当/闭形式、Poincaré 引理、Mayer-Vietoris、Betti 数、de Rham 定理 | MIT 18.952, Cambridge Part III |
| [mini-tangent-bundles](mini-tangent-bundles/) | 切丛与向量丛 — 切向量作为导子、丛理论、标架丛、联络、黎曼度量、测地线 | MIT 18.901 / MIT 18.950, Stanford MATH 215 |
| [mini-transversality](mini-transversality/) | 横截性理论 — 射流空间、Thom 横截定理、参数横截性、分层/等变横截性、相交理论 | MIT 18.966, Stanford MATH 215C, Berkeley MATH 214 |
| [mini-vector-fields-flows](mini-vector-fields-flows/) | 向量场与流 — 积分曲线、Lie 括号、流箱定理、Frobenius 可积性定理、Lie 代数 | MIT 18.901, Stanford MATH 215B |
| [mini-sard-morse](mini-sard-morse/) | Sard 定理与 Morse 理论 — 临界点、正则值、Sard 定理、Morse 函数、手柄分解、Morse 不等式 | MIT 18.901 / MIT 18.966, Stanford MATH 215C, Princeton MAT 560 |
| [mini-cobordism](mini-cobordism/) | 配边理论 — 配边群、Pontryagin-Thom 构造、h-配边定理、割补术、奇异球面、Thom 谱 | MIT 18.905, Stanford MATH 215C, Berkeley Math 214 |

## 设计哲学

- **零外部依赖** — 纯 Lean 4，仅需标准 `lake` 工具链；除 Lean 内核外不依赖任何外部库
- **子模块独立自洽** — 每个模块拥有独立的 `lakefile.lean`、`Main.lean`、`Core/`、`Theorems/`、`Properties/`、`Morphisms/`、`Constructions/`、`Bridges/`、`Advanced/`、`Test/` 与基准测试套件
- **理论到代码的映射** — 每个模块通过 `CourseAlignment.lean` 提供与教科书定理（Guillemin-Pollack, Hirsch, Milnor, Bott-Tu）及讲义的内联引用
- **全谱系形式化** — 每个子模块将所在领域视为一个数学范畴：对象（Core）、性质（Properties）、态射（Morphisms）、构造（Constructions）、定理（Theorems）、跨领域桥梁（Bridges）、进阶专题（Advanced）

## 构建

每个子模块均为独立 Lean 4 包。使用 `lake` 构建：

```bash
cd mini-smooth-manifolds
lake build
```

运行冒烟测试：

```bash
lake exe mini-smooth-manifolds
```

需要 **Lean 4**（elan/lake 工具链）。各子模块 `README.md` 中详列课程对标与覆盖度报告。

## 项目结构

```
12. mini-smooth-manifold-diff-topology/
├── mini-smooth-manifolds/          # 光滑流形 — 坐标卡、图册、光滑映射、嵌入
├── mini-differential-forms/        # 微分形式 — 外代数、Stokes 定理、示性类
├── mini-de-rham-cohomology/        # de Rham 上同调 — 上链复形、Poincaré 引理、Betti 数
├── mini-tangent-bundles/           # 切丛 — 向量丛、联络、黎曼度量
├── mini-transversality/            # 横截性 — Thom 横截定理、射流空间、相交理论
├── mini-vector-fields-flows/       # 向量场与流 — 积分曲线、Lie 括号、Frobenius 定理
├── mini-sard-morse/                # Sard/Morse — 临界点、手柄分解、Morse 不等式
├── mini-cobordism/                 # 配边理论 — Pontryagin-Thom、h-配边、割补术、奇异球面
├── lean-toolchain
├── .gitignore
├── README.md
└── README-CN.md
```

## 许可证

MIT
