import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure DescentDataPackage where
  baseCategory : Type u
  fibreCategory : Type u → Type v
  coveringFamily : (c : Type u) → Set (c → c)
  descentCondition : Prop
  effectiveDescent : Prop

structure DescentDataEvidence (D : DescentDataPackage) where
  descentConditionClosed : D.descentCondition
  effectiveDescentClosed : D.effectiveDescent

def DescentDataClosed (D : DescentDataPackage) : Prop :=
  D.descentCondition ∧ D.effectiveDescent

theorem descent_data_closed_from_evidence (D : DescentDataPackage) (E : DescentDataEvidence D) : DescentDataClosed D :=
  And.intro E.descentConditionClosed E.effectiveDescentClosed

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse