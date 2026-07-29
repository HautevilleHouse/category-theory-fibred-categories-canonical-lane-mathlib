import CategoryTheoryFibredCategoriesCanonicalLaneLean.FibredCategory

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure CartesianArrowPackage {F : FibredCategoryPackage} where
  arrowInTotal : Type
  cartesianProperty : Prop
  pullbackUniqueness : Prop
  compositionStability : Prop

structure CartesianArrowEvidence {F : FibredCategoryPackage}
    (C : CartesianArrowPackage F) where
  cartesianPropertyClosed : C.cartesianProperty
  pullbackUniquenessClosed : C.pullbackUniqueness
  compositionStabilityClosed : C.compositionStability

def CartesianArrowClosed {F : FibredCategoryPackage}
    (C : CartesianArrowPackage F) : Prop :=
  C.cartesianProperty ∧ C.pullbackUniqueness ∧ C.compositionStability

theorem cartesian_arrow_closed_from_evidence {F : FibredCategoryPackage}
    (C : CartesianArrowPackage F) (E : CartesianArrowEvidence C) :
    CartesianArrowClosed C := by
  exact And.intro E.cartesianPropertyClosed
    (And.intro E.pullbackUniquenessClosed E.compositionStabilityClosed)

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse