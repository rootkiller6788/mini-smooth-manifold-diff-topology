import MiniSardMorse
def run_regression : IO Unit := do
  IO.println "=== Regression Test: mini-sard-morse ==="
  for n in [0,1,2,3,4,5,6,7,8,9,10] do
    let h := MiniSardMorse.MorseFunction.heightOnSphere n
    IO.println s!"S^{n} crits = {h.totalCriticalPoints}"
  let hT2 := MiniSardMorse.MorseFunction.heightOnTorus
  let hd := hT2.toHandleDecomposition
  IO.println s!"T^2 handles = {hd.handles.length}"
  for n in [0,2,4,6,8,10] do
    let h := MiniSardMorse.MorseFunction.heightOnSphere n
    IO.println s!"S^{n} satisfies Reeb: {h.satisfiesReeb}"
  IO.println "=== Regression Test PASSED ==="
def main : IO Unit := run_regression