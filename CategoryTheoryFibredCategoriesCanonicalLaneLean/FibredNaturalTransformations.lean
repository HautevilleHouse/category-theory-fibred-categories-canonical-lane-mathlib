import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.FibredCategoryDefinitions

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

/-!
# Fibred Natural Transformations
This module defines natural transformations between functors over a base category.
-/

structure NaturalTransformation (C D : Category) (F G : Functor C D) where
  components : (X : C.Obj) → D.Hom (F.objMap X) (G.objMap X)
  naturality : ∀ {X Y : C.Obj} (f : C.Hom X Y), 
    D.comp (components X) (G.homMap f) = D.comp (F.homMap f) (components Y)

structure FibredNaturalTransformation (E B : Category) (p q : Functor E B) (F G : Functor E E) where
  baseNaturalTransformation : NaturalTransformation E E F G
  overBase : ∀ x : E.Obj, p.homMap (baseNaturalTransformation.components x) = q.homMap (baseNaturalTransformation.components x)

def fibred_natural_transformation_closed (E B : Category) (p q : Functor E B) (F G : Functor E E) (α : FibredNaturalTransformation E B p q F G) : Prop :=
  ∀ x : E.Obj, p.homMap (α.baseNaturalTransformation.components x) = q.homMap (α.baseNaturalTransformation.components x)

theorem fibred_natural_transformation_closed_from_evidence (E B : Category) (p q : Functor E B) (F G : Functor E E) (α : FibredNaturalTransformation E B p q F G) :
    fibred_natural_transformation_closed E B p q F G α :=
  α.overBase

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse