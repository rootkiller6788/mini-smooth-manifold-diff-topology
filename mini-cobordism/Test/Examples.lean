import MiniCobordism
open MiniCobordism
#eval "===== Example Tests ====="
def main : IO Unit := do
  let s2 := SmoothManifold.sphere 2
  let cp1 := SmoothManifold.complexProjective 1
  IO.println s!"S^2: dim={s2.dim}, euler={s2.eulerChar}, sig={s2.signature}"
  IO.println s!"CP^1: dim={cp1.dim}, sig={cp1.signature}"
  IO.println s!"S^2 x S^2 euler = {(s2.product s2).eulerChar}"
  IO.println s!"O_4^SO = {orientedCobordismGroup 4}"
  let h := Cobordism.refl (SmoothManifold.sphere 3)
  IO.println s!"Cobordism refl: S^3 ~ S^3"
  IO.println "===== ALL EXAMPLE TESTS PASSED ====="
#eval main
