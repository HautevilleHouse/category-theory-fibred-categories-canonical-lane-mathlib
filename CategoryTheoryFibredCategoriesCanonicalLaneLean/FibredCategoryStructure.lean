import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure FibredCategory (𝒞 : Type u) [Category.{v} 𝒞] (𝒮 : Type w) [Category.{t} 𝒮] (p : 𝒞 → 𝒮) where
  fibration : Functorial p
  cartesianLift : ∀ {s : 𝒮} {c : 𝒞} (f : s → p.obj c) → Lift f c
  cartesianUniversal : ∀ {c' : 𝒞} (g : p.obj c' → s) (h : c' → c) (comm : p.map h = g ≫ f) → ∃! h' : c' → cartesianLift f c, p.map h' = g ∧ h' ≫ cartesianLift f c = h

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse