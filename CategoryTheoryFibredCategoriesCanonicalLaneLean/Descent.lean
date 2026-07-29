import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.Cleavage

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure DescentPackage {C : Type u} [Category C] {F : C → Type v} [∀ x, Category (F x)]
    {P : FibredCategoryPackage F} (Cl : CleavagePackage P) where
  descentData : ∀ {x : C} (U : Sieve x) (descent : DescentData U F), Prop
  effectiveDescent : ∀ {x : C} (U : Sieve x) (descent : DescentData U F),
    descentData U descent → EffectiveDescent U descent
  uniqueness : ∀ {x : C} (U : Sieve x) (descent1 descent2 : DescentData U F),
    descentData U descent1 → descentData U descent2 → descent1 = descent2

structure DescentEvidence {C : Type u} [Category C] {F : C → Type v} [∀ x, Category (F x)]
    {P : FibredCategoryPackage F} {Cl : CleavagePackage P}
    (D : DescentPackage Cl) where
  descentDataDefined : True
  effectiveDescentClosed : D.effectiveDescent
  uniquenessClosed : D.uniqueness

def DescentClosed {C : Type u} [Category C] {F : C → Type v} [∀ x, Category (F x)]
    {P : FibredCategoryPackage F} {Cl : CleavagePackage P}
    (D : DescentPackage Cl) : Prop :=
  D.effectiveDescent ∧ D.uniqueness

theorem descent_closed_from_evidence {C : Type u} [Category C]
    {F : C → Type v} [∀ x, Category (F x)] {P : FibredCategoryPackage F}
    {Cl : CleavagePackage P} (D : DescentPackage Cl)
    (E : DescentEvidence D) : DescentClosed D := by
  exact And.intro E.effectiveDescentClosed E.uniquenessClosed

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse