import CategoryTheoryFibredCategoriesCanonicalLaneLean.FibredCategory

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure CartesianMorphismPackage (P : FibredCategoryPackage) where
  source : P.totalCat
  target : P.totalCat
  map : source → target
  projectionEqual : P.proj map = P.proj target
  universalProperty : ∀ (h : P.totalCat) (ψ : h → target), ∃! (χ : h → source), map ∘ χ = ψ
  universalPropertyClosed : universalProperty

structure CartesianMorphismEvidence {P : FibredCategoryPackage} (C : CartesianMorphismPackage P) where
  universalPropertyClosed : C.universalProperty

def CartesianMorphismClosed {P : FibredCategoryPackage} (C : CartesianMorphismPackage P) : Prop :=
  C.universalProperty

theorem cartesian_morphism_closed_from_evidence
    {P : FibredCategoryPackage} (C : CartesianMorphismPackage P) (E : CartesianMorphismEvidence C) :
    CartesianMorphismClosed C := by
  exact E.universalPropertyClosed

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse
