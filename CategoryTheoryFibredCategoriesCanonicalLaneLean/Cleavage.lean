import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.FibredCategory

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure CleavagePackage {C : Type u} [Category C] {F : C → Type v} [∀ x, Category (F x)]
    (P : FibredCategoryPackage F) where
  chosenLifts : ∀ {x y : C} (f : x ⟶ y) (a : F y),
    Σ (b : F x), (fiberFunctor f) b ≅ a
  cartesianProperty : ∀ {x y : C} (f : x ⟶ y) (a : F y),
    let (b, φ) := chosenLifts f a in IsCartesian f b a φ
  uniqueness : ∀ {x y : C} (f : x ⟶ y) (a : F y) (b1 b2 : F x)
    (φ1 : (fiberFunctor f) b1 ≅ a) (φ2 : (fiberFunctor f) b2 ≅ a),
    (IsCartesian f b1 a φ1 ∧ IsCartesian f b2 a φ2) → (b1 ≅ b2)

structure CleavageEvidence {C : Type u} [Category C] {F : C → Type v} [∀ x, Category (F x)]
    {P : FibredCategoryPackage F} (Cl : CleavagePackage P) where
  chosenLiftsDefined : True
  cartesianPropertyClosed : Cl.cartesianProperty
  uniquenessClosed : Cl.uniqueness

def CleavageClosed {C : Type u} [Category C] {F : C → Type v} [∀ x, Category (F x)]
    {P : FibredCategoryPackage F} (Cl : CleavagePackage P) : Prop :=
  Cl.cartesianProperty ∧ Cl.uniqueness

theorem cleavage_closed_from_evidence {C : Type u} [Category C]
    {F : C → Type v} [∀ x, Category (F x)] {P : FibredCategoryPackage F}
    (Cl : CleavagePackage P) (E : CleavageEvidence Cl) : CleavageClosed Cl := by
  exact And.intro E.cartesianPropertyClosed E.uniquenessClosed

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse