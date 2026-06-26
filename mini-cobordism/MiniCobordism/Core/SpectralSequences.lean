import MiniObjectKernel.Core.Basic
import MiniCobordism.Core.Basic
namespace MiniCobordism
open MiniObjectKernel

def adamsSS_description : String := "Ext_A^{s,t}(F_2, F_2) => pi_{t-s}^S"
def anss_description : String := "Ext_{MU_*MU}^{s,t}(MU_*, MU_*) => pi_{t-s}^S"
def ahss_description : String := "H_p(X; O_q) => O_{p+q}(X)"
def serreSS_description : String := "H_p(B; H_q(F)) => H_{p+q}(E)"
def bocksteinSS_description : String := "Computes p-torsion from mod p homology"
def maySS_description : String := "Computes Ext over Steenrod algebra efficiently"

def allSpectralSequences : List String := [
  adamsSS_description, anss_description, ahss_description,
  serreSS_description, bocksteinSS_description, maySS_description
]

#eval "== Spectral Sequences =="
#eval allSpectralSequences


end MiniCobordism
