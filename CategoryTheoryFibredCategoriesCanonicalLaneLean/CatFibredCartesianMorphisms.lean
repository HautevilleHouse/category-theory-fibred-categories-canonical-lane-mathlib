import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure CartesianMorphismPackage where
  source : Type u
  target : Type u
  morphism : source → target
  cartesianProperty : Prop
  universalProperty : Prop

structure CartesianMorphismEvidence (C : CartesianMorphismPackage) where
  cartesianPropertyClosed : C.cartesianProperty
  universalPropertyClosed : C.universalProperty

def CartesianMorphismClosed (C : CartesianMorphismPackage) : Prop :=
  C.cartesianProperty ∧ C.universalProperty

theorem cartesian_morphism_closed_from_evidence (C : CartesianMorphismPackage) (E : CartesianMorphismEvidence C) : CartesianMorphismClosed C :=
  And.intro E.cartesianPropertyClosed E.universalPropertyClosed

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse