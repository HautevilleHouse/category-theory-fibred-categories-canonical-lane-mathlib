import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

/-!
# Fibred Category Definitions
This module defines the fundamental structures for fibred categories.
-/

structure Category where
  Obj : Type u
  Hom : Obj → Obj → Type v
  id : (X : Obj) → Hom X X
  comp : {X Y Z : Obj} → Hom X Y → Hom Y Z → Hom X Z
  id_comp : ∀ {X Y} (f : Hom X Y), comp (id X) f = f
  comp_id : ∀ {X Y} (f : Hom X Y), comp f (id Y) = f
  assoc : ∀ {W X Y Z} (f : Hom W X) (g : Hom X Y) (h : Hom Y Z), comp (comp f g) h = comp f (comp g h)

structure Functor (C D : Category) where
  objMap : C.Obj → D.Obj
  homMap : {X Y : C.Obj} → C.Hom X Y → D.Hom (objMap X) (objMap Y)
  map_id : ∀ (X : C.Obj), homMap (C.id X) = D.id (objMap X)
  map_comp : ∀ {X Y Z : C.Obj} (f : C.Hom X Y) (g : C.Hom Y Z), homMap (C.comp f g) = D.comp (homMap f) (homMap g)

structure Pullback (C : Category) (F : Functor C (Category)) where
  obj : C.Obj
  cartesian : Prop

structure FibredCategory (E B : Category) (p : Functor E B) where
  cartesianLift : ∀ {b : B.Obj} (x : E.Obj) (f : B.Hom b (p.objMap x)), 
    ∃ (y : E.Obj) (φ : E.Hom y x), p.homMap φ = f ∧ (∀ (z : E.Obj) (ψ : E.Hom z x) (g : B.Hom (p.objMap z) b), 
      p.homMap ψ = f ∘ g → ∃! (χ : E.Hom z y), p.homMap χ = g ∧ E.comp χ φ = ψ)
  fibred : ∀ {x y : E.Obj} (f : B.Hom (p.objMap x) (p.objMap y)), 
    ∃ (φ : E.Hom x y), p.homMap φ = f

def fibred_category_admissible (E B : Category) (p : Functor E B) : Prop :=
  ∀ (b : B.Obj) (x : E.Obj) (f : B.Hom b (p.objMap x)), 
    ∃ (y : E.Obj) (φ : E.Hom y x), p.homMap φ = f ∧ (∀ (z : E.Obj) (ψ : E.Hom z x) (g : B.Hom (p.objMap z) b), 
      p.homMap ψ = f ∘ g → ∃! (χ : E.Hom z y), p.homMap χ = g ∧ E.comp χ φ = ψ)

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse