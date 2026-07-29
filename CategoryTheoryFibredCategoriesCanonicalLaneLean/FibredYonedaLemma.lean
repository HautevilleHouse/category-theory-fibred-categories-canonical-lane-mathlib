import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure FibredYonedaPackage where
  baseCategory : Type u
  fibreCategory : Type u → Type v
  yonedaEmbedding : (c : Type u) → fibreCategory c → (d : Type u) → (f : d → c) → fibreCategory d
  fullyFaithful : Prop
  naturality : Prop

structure FibredYonedaEvidence (Y : FibredYonedaPackage) where
  fullyFaithfulClosed : Y.fullyFaithful
  naturalityClosed : Y.naturality

def FibredYonedaClosed (Y : FibredYonedaPackage) : Prop :=
  Y.fullyFaithful ∧ Y.naturality

theorem fibred_yoneda_closed_from_evidence (Y : FibredYonedaPackage) (E : FibredYonedaEvidence Y) : FibredYonedaClosed Y :=
  And.intro E.fullyFaithfulClosed E.naturalityClosed

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse