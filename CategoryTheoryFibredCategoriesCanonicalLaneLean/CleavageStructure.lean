import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure CleavagePackage where
  baseCategory : Type u
  fibreCategory : Type u → Type v
  cleavage : (f : baseCategory → baseCategory) → (A : fibreCategory (source f)) → CartesianMorphismPackage
  cleavageExists : Prop
  cleavageConsistency : Prop

structure CleavageEvidence (C : CleavagePackage) where
  cleavageExistsClosed : C.cleavageExists
  cleavageConsistencyClosed : C.cleavageConsistency

def CleavageClosed (C : CleavagePackage) : Prop :=
  C.cleavageExists ∧ C.cleavageConsistency

theorem cleavage_closed_from_evidence (C : CleavagePackage) (E : CleavageEvidence C) : CleavageClosed C :=
  And.intro E.cleavageExistsClosed E.cleavageConsistencyClosed

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse