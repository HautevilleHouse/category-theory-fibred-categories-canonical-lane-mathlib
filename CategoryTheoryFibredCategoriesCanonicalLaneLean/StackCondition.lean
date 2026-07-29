import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.Descent

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure StackCondition {𝒞 : Type u} [Category.{v} 𝒞] {𝒮 : Type w} [Category.{t} 𝒮] (p : 𝒞 → 𝒮) where
  descentData : DescentData p
  effectiveDescent : ∀ (s : 𝒮), descentData.glueing s ⋙ descentData.glueing s = 𝟭 (descentData.FibreCategory s)
  stackConditionClosed : Prop

def stackConditionClosedDef {𝒞 : Type u} [Category.{v} 𝒞] {𝒮 : Type w} [Category.{t} 𝒮] {p : 𝒞 → 𝒮} (S : StackCondition p) : Prop :=
  S.effectiveDescent

theorem stack_condition_closed_by_effectivity {𝒞 : Type u} [Category.{v} 𝒞] {𝒮 : Type w} [Category.{t} 𝒮] {p : 𝒞 → 𝒮} (S : StackCondition p) : stackConditionClosedDef S := by
  intro s
  exact S.effectiveDescent s

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse