import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryFibredCategoriesCanonicalLaneLean.FibredCategoryDefinitions

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

/-!
# Cleavage Lemmas
This module provides lemmas about cleavages, which are choices of cartesian lifts.
-/

structure Cleavage (E B : Category) (p : Functor E B) where
  lift : ∀ (b : B.Obj) (x : E.Obj) (f : B.Hom b (p.objMap x)), 
    ∃ (y : E.Obj) (φ : E.Hom y x), p.homMap φ = f ∧ (∀ (z : E.Obj) (ψ : E.Hom z x) (g : B.Hom (p.objMap z) b), 
      p.homMap ψ = f ∘ g → ∃! (χ : E.Hom z y), p.homMap χ = g ∧ E.comp χ φ = ψ)

def cleavage_closed (E B : Category) (p : Functor E B) (C : Cleavage E B p) : Prop :=
  ∀ (b : B.Obj) (x : E.Obj) (f : B.Hom b (p.objMap x)), 
    ∃ (y : E.Obj) (φ : E.Hom y x), p.homMap φ = f ∧ (∀ (z : E.Obj) (ψ : E.Hom z x) (g : B.Hom (p.objMap z) b), 
      p.homMap ψ = f ∘ g → ∃! (χ : E.Hom z y), p.homMap χ = g ∧ E.comp χ φ = ψ)

theorem cleavage_from_admissible_class (E B : Category) (p : Functor E B) (A : AdmissibleClass) (h : fibred_category_admissible E B p) : 
    ∀ (b : B.Obj) (x : E.Obj) (f : B.Hom b (p.objMap x)), 
    ∃ (y : E.Obj) (φ : E.Hom y x), p.homMap φ = f ∧ (∀ (z : E.Obj) (ψ : E.Hom z x) (g : B.Hom (p.objMap z) b), 
      p.homMap ψ = f ∘ g → ∃! (χ : E.Hom z y), p.homMap χ = g ∧ E.comp χ φ = ψ) :=
  by
    intro b x f
    exact h b x f

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse