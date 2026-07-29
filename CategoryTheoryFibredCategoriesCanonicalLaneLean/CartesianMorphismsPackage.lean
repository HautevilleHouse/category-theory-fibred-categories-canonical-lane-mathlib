import CategoryTheoryFibredCategoriesCanonicalLaneLean.CleavagePackage

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure CartesianMorphismPackage {F : FibredCategoryPackage} {C : CleavagePackage F} where
  cartesianDefined : Prop
  compositionClosed : Prop
  identityClosed : Prop
  pullbackStability : Prop

def CartesianMorphismClosed {F : FibredCategoryPackage} {C : CleavagePackage F} (M : CartesianMorphismPackage C) : Prop :=
  M.cartesianDefined ∧ M.compositionClosed ∧ M.identityClosed ∧ M.pullbackStability

structure CartesianMorphismEvidence {F : FibredCategoryPackage} {C : CleavagePackage F} (M : CartesianMorphismPackage C) where
  cartesianDefinedClosed : M.cartesianDefined
  compositionClosedClosed : M.compositionClosed
  identityClosedClosed : M.identityClosed
  pullbackStabilityClosed : M.pullbackStability

theorem cartesian_morphism_closed_from_evidence {F : FibredCategoryPackage} {C : CleavagePackage F} (M : CartesianMorphismPackage C) (E : CartesianMorphismEvidence M) :
    CartesianMorphismClosed M := by
  exact And.intro E.cartesianDefinedClosed (And.intro E.compositionClosedClosed (And.intro E.identityClosedClosed E.pullbackStabilityClosed))

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse