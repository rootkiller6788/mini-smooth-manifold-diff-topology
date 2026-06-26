import MiniSardMorse
def run_smoke : IO Unit := do
  IO.println "=== Smoke Test: mini-sard-morse ==="
  let s2 := MiniSardMorse.SmoothManifold.sphere 2
  IO.println s!"S^2 dim = {s2.dim}"
  IO.println s!"S^2 euler = {s2.eulerChar}"
  let h := MiniSardMorse.MorseFunction.heightOnSphere 3
  IO.println s!"hS^3 crit pts = {h.totalCriticalPoints}"
  IO.println "=== Smoke Test PASSED ==="
def main : IO Unit := run_smoke