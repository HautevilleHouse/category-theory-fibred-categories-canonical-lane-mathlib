import CategoryTheoryFibredCategoriesCanonicalLaneLean.CleavageAndCartesian

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure DescentPackage where
  descentData : Prop
  descentCondition : Prop
  effectiveDescent : Prop

structure DescentEvidence (D : DescentPackage) where
  descentDataClosed : D.descentData
  descentConditionClosed : D.descentCondition
  effectiveDescentClosed : D.effectiveDescent

def DescentClosed (D : DescentPackage) : Prop :=
  D.descentData ∧ D.descentCondition ∧ D.effectiveDescent

theorem descent_closed_from_evidence (D : DescentPackage) (E : DescentEvidence D) :
    DescentClosed D := by
  exact And.intro E.descentDataClosed (And.intro E.descentConditionClosed E.effectiveDescentClosed)

structure StackPackage where
  isStack : Prop
  descentIsEffective : Prop
  gluingCondition : Prop

structure StackEvidence (S : StackPackage) where
  isStackClosed : S.isStack
  descentIsEffectiveClosed : S.descentIsEffective
  gluingConditionClosed : S.gluingCondition

def StackClosed (S : StackPackage) : Prop :=
  S.isStack ∧ S.descentIsEffective ∧ S.gluingCondition

theorem stack_closed_from_evidence (S : StackPackage) (E : StackEvidence S) :
    StackClosed S := by
  exact And.intro E.isStackClosed (And.intro E.descentIsEffectiveClosed E.gluingConditionClosed)

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse