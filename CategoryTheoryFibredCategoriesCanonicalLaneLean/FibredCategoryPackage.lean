import Mathlib.CategoryTheory.Fibred.Fibred
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure FibredCategoryObject where
  base : Type u
  total : Type v
  functor : total → base
  cartesianArrows : Prop
  cleavage : Prop
  cleavageFunction : ∀ (f : a → b in base) (x : total such that functor x = b), ∃ (cartesian lift of f at x)
  conclusion : cartesianArrows ∧ cleavage

structure FibredCategoryEvidence (O : FibredCategoryObject) where
  cartesianArrowsClosed : O.cartesianArrows
  cleavageClosed : O.cleavage

def FibredCategoryWitnessClosed (O : FibredCategoryObject) : Prop :=
  O.cartesianArrows ∧ O.cleavage

theorem fibred_category_closed_from_evidence (O : FibredCategoryObject) (E : FibredCategoryEvidence O) : FibredCategoryWitnessClosed O := by
  exact And.intro E.cartesianArrowsClosed E.cleavageClosed

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse
