import CategoryTheoryFibredCategoriesCanonicalLaneLean.DescentAndStack

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure FibredAdjunctionPackage where
  leftAdjointFibred : Prop
  rightAdjointFibred : Prop
  adjunctionCompatibility : Prop
  unitCounitNatural : Prop

structure FibredAdjunctionEvidence (F : FibredAdjunctionPackage) where
  leftAdjointFibredClosed : F.leftAdjointFibred
  rightAdjointFibredClosed : F.rightAdjointFibred
  adjunctionCompatibilityClosed : F.adjunctionCompatibility
  unitCounitNaturalClosed : F.unitCounitNatural

def FibredAdjunctionClosed (F : FibredAdjunctionPackage) : Prop :=
  F.leftAdjointFibred ∧ F.rightAdjointFibred ∧ F.adjunctionCompatibility ∧ F.unitCounitNatural

theorem fibred_adjunction_closed_from_evidence (F : FibredAdjunctionPackage) (E : FibredAdjunctionEvidence F) :
    FibredAdjunctionClosed F := by
  exact And.intro E.leftAdjointFibredClosed
    (And.intro E.rightAdjointFibredClosed
      (And.intro E.adjunctionCompatibilityClosed E.unitCounitNaturalClosed))

structure FibredLimitPackage where
  limitExists : Prop
  limitCone : Prop
  universalProperty : Prop

structure FibredLimitEvidence (L : FibredLimitPackage) where
  limitExistsClosed : L.limitExists
  limitConeClosed : L.limitCone
  universalPropertyClosed : L.universalProperty

def FibredLimitClosed (L : FibredLimitPackage) : Prop :=
  L.limitExists ∧ L.limitCone ∧ L.universalProperty

theorem fibred_limit_closed_from_evidence (L : FibredLimitPackage) (E : FibredLimitEvidence L) :
    FibredLimitClosed L := by
  exact And.intro E.limitExistsClosed (And.intro E.limitConeClosed E.universalPropertyClosed)

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse