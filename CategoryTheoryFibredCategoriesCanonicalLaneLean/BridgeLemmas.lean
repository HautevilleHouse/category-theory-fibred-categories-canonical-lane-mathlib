import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryFibredCategoriesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CategoryTheoryWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategoryTheoryFibredCategoriesCanonicalLaneLean
end HautevilleHouse