import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Before;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;


import java.io.IOException;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class ApiRunnerTest {


    @Test
    public void Testparallel(){
        String resultPath = "C:\\Users\\IB\\Downloads\\Karate\\Karate\\src\\test\\resources\\feature\\export";
        Results result = Runner.path("classpath:feature/import")
                .reportDir(resultPath)
                .tags()
                .parallel(10);
        assertTrue(result.getFailCount()==0);

        System.out.println("Rapports générés dans : " + result.getReportDir());
    }


}
