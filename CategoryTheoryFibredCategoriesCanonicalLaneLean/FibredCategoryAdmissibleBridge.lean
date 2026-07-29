import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.StackCondition

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure FibredCategoryAdmissibleObject (𝒞 : Type u) [Category.{v} 𝒞] (𝒮 : Type w) [Category.{t} 𝒮] where
  p : 𝒞 → 𝒮
  fibration : FibredCategory 𝒞 𝒮 p
  stackCondition : StackCondition p

def bridgeClosed (A : FibredCategoryAdmissibleObject 𝒞 𝒮) : Prop :=
  stackConditionClosedDef A.stackCondition

theorem bridge_from_admissible_class (A : FibredCategoryAdmissibleObject 𝒞 𝒮) : bridgeClosed A := by
  exact stack_condition_closed_by_effectivity A.stackCondition

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse