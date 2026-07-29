import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure PullbackPersistencePackage (F : FibredCategoryPackage) where
  pullbackExists : Prop
  pullbackUnique : Prop
  compositionPreservesPullback : Prop
  baseChangeCompatibility : Prop

def PullbackPersistenceClosed (F : FibredCategoryPackage) (P : PullbackPersistencePackage F) : Prop :=
  P.pullbackExists ∧ P.pullbackUnique ∧ P.compositionPreservesPullback ∧ P.baseChangeCompatibility

structure PullbackPersistenceEvidence {F : FibredCategoryPackage} (P : PullbackPersistencePackage F) where
  pullbackExistsClosed : P.pullbackExists
  pullbackUniqueClosed : P.pullbackUnique
  compositionPreservesPullbackClosed : P.compositionPreservesPullback
  baseChangeCompatibilityClosed : P.baseChangeCompatibility

theorem pullback_persistence_closed_from_evidence {F : FibredCategoryPackage}
    (P : PullbackPersistencePackage F) (E : PullbackPersistenceEvidence P) :
    PullbackPersistenceClosed F P := by
  exact And.intro E.pullbackExistsClosed
    (And.intro E.pullbackUniqueClosed
      (And.intro E.compositionPreservesPullbackClosed E.baseChangeCompatibilityClosed))

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse