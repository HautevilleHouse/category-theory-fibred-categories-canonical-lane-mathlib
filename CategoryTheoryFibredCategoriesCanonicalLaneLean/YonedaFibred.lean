import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.FibredCategoryStructure

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure YonedaFibred (𝒞 : Type u) [Category.{v} 𝒞] where
  yonedaEmbedding : 𝒞 ⥤ Presheaves 𝒞
  fibreOverObject : (X : 𝒞) → FibredCategory (𝒞 / X) 𝒞 (forget X)
  yonedaLiftsCartesian : ∀ (X : 𝒞) (f : Y ⟶ X) (g : Z ⟶ X), IsCartesian (yonedaEmbedding.map f) g

def yonedaFibredClosed {𝒞 : Type u} [Category.{v} 𝒞] (Y : YonedaFibred 𝒞) : Prop :=
  ∀ (X : 𝒞) (f : Y ⟶ X) (g : Z ⟶ X), Y.yonedaLiftsCartesian X f g

theorem yoneda_fibred_closed_by_lift_property {𝒞 : Type u} [Category.{v} 𝒞] (Y : YonedaFibred 𝒞) : yonedaFibredClosed Y := by
  intro X f g
  exact Y.yonedaLiftsCartesian X f g

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse