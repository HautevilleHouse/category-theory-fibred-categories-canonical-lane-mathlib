import CategoryTheoryFibredCategoriesCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CategorySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CategoryAdmittedObject where
  space : CategorySpace
  fibredStructure : Prop
  cartesianMorphismsExist : Prop
  cleavageExists : Prop
  fibredAdjunction : Prop
  conclusion : fibredAdjunction ∧ cleavageExists ∧ cartesianMorphismsExist

structure CategoryEndgameState where
  object : CategoryAdmittedObject

def CategoryWitnessClosed (O : CategoryAdmittedObject) : Prop :=
  O.fibredAdjunction ∧ O.cleavageExists ∧ O.cartesianMorphismsExist

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse