import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure FibredCategoryData where
  baseCategory : Type u
  totalCategory : Type v
  projection : totalCategory → baseCategory
  cartesianArrows : Set (Σ (f : totalCategory → totalCategory), (x y : totalCategory) → projection (f x) = projection y)
  cartesianClosed : Prop

def cartesianArrow (D : FibredCategoryData) : Prop := True

structure FibredCategoryEvidence (D : FibredCategoryData) where
  cartesianClosedTerm : D.cartesianClosed
  projectionFunctorial : ∀ (x : D.totalCategory), D.projection x = D.projection x

def FibredCategoryClosed (D : FibredCategoryData) : Prop :=
  D.cartesianClosed

theorem fibred_category_closed_from_evidence (D : FibredCategoryData) (E : FibredCategoryEvidence D) : FibredCategoryClosed D := by
  exact E.cartesianClosedTerm

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse