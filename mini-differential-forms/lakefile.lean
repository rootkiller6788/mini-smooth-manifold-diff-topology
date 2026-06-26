import Lake
open Lake DSL

package «mini-differential-forms» where

@[default_target]
lean_lib «MiniDifferentialForms» where
  roots := #[`MiniDifferentialForms]

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
