import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;


import java.io.IOException;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class ApiRunnerTest {


    @Test
    public void Testparallel(){
        Results result = Runner.path("classpath:feature/TP1/GetUserTest.feature")
                .tags()
                .parallel(10);
        assertTrue(result.getFailCount()==0, "Il y a des échecs : " + result.getErrorMessages());

    }


}
