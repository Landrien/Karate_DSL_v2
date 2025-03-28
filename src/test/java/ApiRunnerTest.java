import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;



import static org.junit.jupiter.api.Assertions.assertTrue;

public class ApiRunnerTest {

    @Test
    public void Testparallel(){
        Results result = Runner.path("classpath:features").tags().parallel(10);
        assertTrue(result.getFailCount()==0);
    }
}
