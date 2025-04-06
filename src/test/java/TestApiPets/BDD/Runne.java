package TestApiPets.BDD;
import com.intuit.karate.junit5.Karate;

class Runne {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("Features/PET/get/GET_PetByID.feature")
                .relativeTo(getClass());
    }    

}
