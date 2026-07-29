import CategoryTheoryFibredCategoriesCanonicalLaneLean.CartesianMorphismsPackage

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure BaseChangePackage {F : FibredCategoryPackage} {C : CleavagePackage F} {M : CartesianMorphismPackage C} where
  baseChangeExists : Prop
  functoriality : Prop
  preservesComposition : Prop
  preservesIdentity : Prop

def BaseChangeClosed {F : FibredCategoryPackage} {C : CleavagePackage F} {M : CartesianMorphismPackage C} (B : BaseChangePackage M) : Prop :=
  B.baseChangeExists ∧ B.functoriality ∧ B.preservesComposition ∧ B.preservesIdentity

structure BaseChangeEvidence {F : FibredCategoryPackage} {C : CleavagePackage F} {M : CartesianMorphismPackage C} (B : BaseChangePackage M) where
  baseChangeExistsClosed : B.baseChangeExists
  functorialityClosed : B.functoriality
  preservesCompositionClosed : B.preservesComposition
  preservesIdentityClosed : B.preservesIdentity

theorem base_change_closed_from_evidence {F : FibredCategoryPackage} {C : CleavagePackage F} {M : CartesianMorphismPackage C} (B : BaseChangePackage M) (E : BaseChangeEvidence B) :
    BaseChangeClosed B := by
  exact And.intro E.baseChangeExistsClosed (And.intro E.functorialityClosed (And.intro E.preservesCompositionClosed E.preservesIdentityClosed))

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse