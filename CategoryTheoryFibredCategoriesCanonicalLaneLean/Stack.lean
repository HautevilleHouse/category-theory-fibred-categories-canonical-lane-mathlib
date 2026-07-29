import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.FibredCategory
import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.DescentData

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure Stack (F : FibredCategory E B) where
  effectiveDescent : ∀ {I : Type u} (d : I → B) (D : DescentData F d),
    (∀ (i : I), DescentDataClosed F d D) → ∃ (x : E), F.p x = colimit d ∧
    ∀ (i : I), Nonempty (IsCartesian (F.cartesianLift (d i ⟶ colimit d) x ?).some)
  stackCondition : ∀ (x y : E) (f g : x ⟶ y) (h : F.map f = F.map g), f = g

def StackClosed (F : FibredCategory E B) (S : Stack F) : Prop :=
  ∀ {I : Type u} (d : I → B) (D : DescentData F d),
    (∀ (i : I), DescentDataClosed F d D) → Nonempty (∃ (x : E), F.p x = colimit d)

theorem stack_closed_from_structure (F : FibredCategory E B) (S : Stack F) :
    StackClosed F S :=
  fun I d D h => Nonempty.intro (S.effectiveDescent d D h).1

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse