import MiniDeRhamCohomology
#eval "══ Smoke Test: mini-de-rham-cohomology ══"
#eval "All modules imported successfully"
#eval "── DGAExpr test ──"
#eval MiniDeRhamCohomology.d (MiniDeRhamCohomology.DGAExpr.var (n:=3) 0)
#eval "── d²=0 test ──"
#eval MiniDeRhamCohomology.d (MiniDeRhamCohomology.d (MiniDeRhamCohomology.DGAExpr.var (n:=3) 0))
#eval "── Betti numbers test ──"
#eval MiniDeRhamCohomology.bettiS2 1
#eval "── Smoke test PASSED ──"
