import MiniSardMorse
def run_examples : IO Unit := do
  IO.println "=== Examples Test: mini-sard-morse ==="
  let f := MiniSardMorse.SmoothMap.id (MiniSardMorse.SmoothManifold.sphere 3)
  IO.println s!"Sard S^3->S^3: {MiniSardMorse.sard_theorem f}"
  let h := MiniSardMorse.MorseFunction.heightOnTorus
  IO.println s!"Weak Morse T^2 k=0: {h.weakMorseInequality 0}"
  IO.println s!"Weak Morse T^2 k=1: {h.weakMorseInequality 1}"
  IO.println s!"CW euler T^2 = {h.toCWComplex.eulerChar}"
  IO.println "=== Examples Test PASSED ==="
def main : IO Unit := run_examples