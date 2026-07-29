import CategoryTheoryFibredCategoriesCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure CleavagePackage where
  cartesianLift : Prop
  uniqueFactorization : Prop
  cleavageExists : Prop
  cleavagesCompatible : Prop

structure CleavageEvidence (C : CleavagePackage) where
  cartesianLiftClosed : C.cartesianLift
  uniqueFactorizationClosed : C.uniqueFactorization
  cleavageExistsClosed : C.cleavageExists
  cleavagesCompatibleClosed : C.cleavagesCompatible

def CleavageClosed (C : CleavagePackage) : Prop :=
  C.cartesianLift ∧ C.uniqueFactorization ∧ C.cleavageExists ∧ C.cleavagesCompatible

theorem cleavage_closed_from_evidence (C : CleavagePackage) (E : CleavageEvidence C) :
    CleavageClosed C := by
  exact And.intro E.cartesianLiftClosed
    (And.intro E.uniqueFactorizationClosed
      (And.intro E.cleavageExistsClosed E.cleavagesCompatibleClosed))

structure CartesianMorphismPackage where
  domainFibre : Type u
  codomainFibre : Type v
  cartesianProperty : Prop
  pullbackStability : Prop

structure CartesianMorphismEvidence (C : CartesianMorphismPackage) where
  cartesianPropertyClosed : C.cartesianProperty
  pullbackStabilityClosed : C.pullbackStability

def CartesianMorphismClosed (C : CartesianMorphismPackage) : Prop :=
  C.cartesianProperty ∧ C.pullbackStability

theorem cartesian_morphism_closed_from_evidence (C : CartesianMorphismPackage) (E : CartesianMorphismEvidence C) :
    CartesianMorphismClosed C := by
  exact And.intro E.cartesianPropertyClosed E.pullbackStabilityClosed

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse