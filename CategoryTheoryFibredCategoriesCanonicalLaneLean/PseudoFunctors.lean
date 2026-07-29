import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure PseudoFunctorPackage where
  sourceCategory : Type u
  targetCategory : Type v
  sourceCategoryStructure : Category sourceCategory
  targetCategoryStructure : Category targetCategory
  objectMap : sourceCategory → targetCategory
  morphismMap : ∀ {x y : sourceCategory}, (x ⟶ y) → (objectMap x ⟶ objectMap y)
  identityPreserved : ∀ (x : sourceCategory), morphismMap (𝟙 x) = 𝟙 (objectMap x)
  compositionPreserved : ∀ {x y z : sourceCategory} (f : x ⟶ y) (g : y ⟶ z),
    morphismMap (f ≫ g) = morphismMap f ≫ morphismMap g
  coherenceConditions : Prop

structure PseudoFunctorEvidence (P : PseudoFunctorPackage) where
  objectMapDefined : True
  morphismMapDefined : True
  identityPreservedClosed : P.identityPreserved
  compositionPreservedClosed : P.compositionPreserved
  coherenceConditionsClosed : P.coherenceConditions

def PseudoFunctorClosed (P : PseudoFunctorPackage) : Prop :=
  P.identityPreserved ∧ P.compositionPreserved ∧ P.coherenceConditions

theorem pseudo_functor_closed_from_evidence (P : PseudoFunctorPackage)
    (E : PseudoFunctorEvidence P) : PseudoFunctorClosed P := by
  exact And.intro E.identityPreservedClosed
    (And.intro E.compositionPreservedClosed E.coherenceConditionsClosed)

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse