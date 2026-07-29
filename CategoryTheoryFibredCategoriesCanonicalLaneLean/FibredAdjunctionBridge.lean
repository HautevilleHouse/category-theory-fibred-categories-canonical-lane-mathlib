import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.FibredCategoryDefs
import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.CleavageLemmas

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

structure FibredAdjunctionBridgePackage (D : FibredCategoryData) where
  adjunctionFunctor : D.totalCategory → D.baseCategory
  adjunctionClosed : Prop
  bridgeToCleavage : CleavageClosed D (default) → adjunctionClosed

def FibredAdjunctionBridgeClosed (D : FibredCategoryData) (P : FibredAdjunctionBridgePackage D) : Prop :=
  P.adjunctionClosed

theorem fibred_adjunction_bridge_from_cleavage (D : FibredCategoryData) (P : FibredAdjunctionBridgePackage D) (h : CleavageClosed D (default)) : FibredAdjunctionBridgeClosed D P := by
  exact P.bridgeToCleavage h

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse