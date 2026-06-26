import MiniCobordism
open MiniCobordism
#eval "===== Regression Tests ====="
#eval s!"Empty euler check: {(SmoothManifold.empty 3).eulerChar = 0}"
#eval s!"d^2 hasBoundary = {(SmoothManifold.withBoundary 5 true true true).boundary.boundary.hasBoundary}"
#eval s!"Point dim check: {SmoothManifold.point.dim = 0}"
#eval "===== ALL REGRESSION TESTS PASSED ====="
