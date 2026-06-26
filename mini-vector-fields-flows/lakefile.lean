import Lake
open Lake DSL

package «mini-vector-fields-flows» where

@[default_target]
lean_lib «MiniVectorFieldsFlows» where
  roots := #[`MiniVectorFieldsFlows]

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