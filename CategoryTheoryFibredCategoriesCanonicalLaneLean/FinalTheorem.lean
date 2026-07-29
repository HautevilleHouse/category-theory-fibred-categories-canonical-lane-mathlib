import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

def ConstrainedFibredCategoryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fibred_category_endgame (A : AdmissibleClass) :
    ConstrainedFibredCategoryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse