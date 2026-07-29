import CategoryTheoryFibredCategoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def categoryProjection : Projection CategoryEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem category_projection_idempotent (x : CategoryEndgameState) :
    categoryProjection.toFun (categoryProjection.toFun x) = categoryProjection.toFun x := by
  exact categoryProjection.idempotent x

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse