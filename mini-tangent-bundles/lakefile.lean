import Lake
open Lake DSL

package «mini-tangent-bundles» where

@[default_target]
lean_lib «MiniTangentBundles» where
  roots := #[`MiniTangentBundles]

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"

lean_exe «smoke-test» where
  root := `Test.Smoke
  supportInterpreter := true

lean_exe «example-test» where
  root := `Test.Examples
  supportInterpreter := true

lean_exe «regression-test» where
  root := `Test.Regression
  supportInterpreter := true
