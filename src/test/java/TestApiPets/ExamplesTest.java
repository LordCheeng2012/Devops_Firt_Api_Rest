package TestApiPets;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class ExamplesTest {

    @Test
    void testParallel() {
        //implementar el runner de karate para la logica AND
        Results results = Runner.path("classpath:TestApiPets/BDD")
                        .tags("@componente").parallel(5);
                //.outputCucumberJson(tru
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
