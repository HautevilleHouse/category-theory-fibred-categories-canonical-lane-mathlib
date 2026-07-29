import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.PseudoFunctors

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure FibredCategoryPackage {C : Type u} [Category C] (F : C → Type v) [∀ x, Category (F x)] where
  baseCategory : C
  fibreOver : ∀ (x : C), F x
  cartesianLift : ∀ {x y : C} (f : x ⟶ y) (a : F x) (b : F y),
    (fiberFunctor f) a → b
  liftProperty : ∀ {x y : C} (f : x ⟶ y) (a : F x) (b : F y),
    (fiberFunctor f) a ≅ b → (cartesianLift f a b)
  compositionOfLifts : ∀ {x y z : C} (f : x ⟶ y) (g : y ⟶ z) (a : F x) (b : F y) (c : F z),
    (h1 : (fiberFunctor f) a → b) (h2 : (fiberFunctor g) b → c) →
    (cartesianLift (f ≫ g) a c) = (cartesianLift g b c) ∘ (cartesianLift f a b)

structure FibredCategoryEvidence {C : Type u} [Category C] {F : C → Type v} [∀ x, Category (F x)]
    (P : FibredCategoryPackage F) where
  cartesianLiftDefined : True
  liftPropertyClosed : P.liftProperty
  compositionOfLiftsClosed : P.compositionOfLifts

def FibredCategoryClosed {C : Type u} [Category C] {F : C → Type v} [∀ x, Category (F x)]
    (P : FibredCategoryPackage F) : Prop :=
  P.liftProperty ∧ P.compositionOfLifts

theorem fibred_category_closed_from_evidence {C : Type u} [Category C]
    {F : C → Type v} [∀ x, Category (F x)] (P : FibredCategoryPackage F)
    (E : FibredCategoryEvidence P) : FibredCategoryClosed P := by
  exact And.intro E.liftPropertyClosed E.compositionOfLiftsClosed

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse