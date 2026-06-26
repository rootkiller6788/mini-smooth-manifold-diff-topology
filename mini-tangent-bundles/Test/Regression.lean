import MiniTangentBundles

def main : IO Unit := do
  IO.println "=== mini-tangent-bundles Regression Test ==="
  let M := MiniTangentBundles.sphereManifold
  let pt : MiniTangentBundles.Point M := ⟨0, by decide⟩
  let idx0 : Fin M.dim := ⟨0, by decide⟩
  
  let v : MiniTangentBundles.TangentSpace M pt := fun i => (i.val + 1 : Int)
  let w : MiniTangentBundles.TangentSpace M pt := fun i => (2 * (i.val + 1) : Int)
  
  let sum1 := MiniTangentBundles.TangentSpace.add v w
  let sum2 := MiniTangentBundles.TangentSpace.add w v
  if sum1 idx0 != sum2 idx0 then
    throw (IO.userError "Add commutativity failed")
  IO.println "  PASS: Addition commutativity"
  
  let zeroPlusV := MiniTangentBundles.TangentSpace.add MiniTangentBundles.TangentSpace.zero v
  if zeroPlusV idx0 != v idx0 then
    throw (IO.userError "Zero add failed")
  IO.println "  PASS: Zero addition"
  
  let X : MiniTangentBundles.VectorField M := fun _ i => (i.val : Int)
  let Y : MiniTangentBundles.VectorField M := fun _ _ => (1 : Int)
  let sumXY := MiniTangentBundles.VectorField.add X Y
  if sumXY pt idx0 != (1 : Int) then
    throw (IO.userError "VF add failed")
  IO.println "  PASS: Vector field addition"
  
  IO.println "All regression tests passed!"
