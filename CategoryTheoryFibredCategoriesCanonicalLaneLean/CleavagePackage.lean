import CategoryTheoryFibredCategoriesCanonicalLaneLean.FibredCategoryDefinitions

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure CleavagePackage {F : FibredCategoryPackage} where
  cleavageProperty : Prop
  eachMorphismHasCartesianLift : Prop
  cleavagedCategory : Prop

def CleavageClosed {F : FibredCategoryPackage} (C : CleavagePackage F) : Prop :=
  C.cleavageProperty ∧ C.eachMorphismHasCartesianLift ∧ C.cleavagedCategory

structure CleavageEvidence {F : FibredCategoryPackage} (C : CleavagePackage F) where
  cleavagePropertyClosed : C.cleavageProperty
  eachMorphismHasCartesianLiftClosed : C.eachMorphismHasCartesianLift
  cleavagedCategoryClosed : C.cleavagedCategory

theorem cleavage_closed_from_evidence {F : FibredCategoryPackage} (C : CleavagePackage F) (E : CleavageEvidence C) :
    CleavageClosed C := by
  exact And.intro E.cleavagePropertyClosed (And.intro E.eachMorphismHasCartesianLiftClosed E.cleavagedCategoryClosed)

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse