import Xray.Connexion;
import Xray.GetFeature;
import Xray.SendFeature;
import org.junit.runner.JUnitCore;

import java.io.IOException;

public class RunnerMain {
    public static void main(String[] args) throws IOException, InterruptedException {
        //Création Objet et récupération du token, cette classe permet d'effectuer les requêtes API
        String token = Connexion.getToken();
        //Récupère fichier zip compressé
        GetFeature.getFeature(token);

        //Permet de run mon runner de test
        JUnitCore.runClasses(ApiRunnerTest.class);
        Thread.sleep(2000);
        //SendFeature.ConcatFileJson();
        //SendFeature.sendResult(token);
    }
}
