package Xray;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.jayway.jsonpath.internal.filter.ValueNode;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.file.Files;
import java.nio.file.Path;

public class SendFeature {

    public static void ConcatFileJson() {
        String inputFolder = "src/test/resources/feature/export";  //
        String outputFile = "src/test/resources/cucumber.json";

        ObjectMapper objectMapper = new ObjectMapper();
        ArrayNode jsonArray = objectMapper.createArrayNode();

        File folder = new File(inputFolder);
        File[] files = folder.listFiles((dir, name) -> name.toLowerCase().endsWith(".json"));

        if (files == null) {
            System.out.println("⚠️ Le dossier est vide ou introuvable !");
            return;
        }

        for (File file : files) {
            try {
                JsonNode jsonNode = objectMapper.readTree(file); // Lire chaque fichier JSON
                jsonArray.add(jsonNode); // Ajouter au tableau final
            } catch (IOException e) {
                System.err.println("Erreur de lecture du fichier : " + file.getName());
                e.printStackTrace();
            }
        }

        try {
            objectMapper.writerWithDefaultPrettyPrinter().writeValue(new File(outputFile), jsonArray);
            System.out.println("JSON concaténé généré dans : " + outputFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static void sendResult(String token) throws IOException, InterruptedException {
        String token3 = token.replace("\"", "");
        //String filePath = "src/test/resources/cucumber.json";
        String filesJSON = "target/surefire-reports/feature.import.1_POEI20252-616,POEI20252-608.json";
        String jsonContent = Files.readString(Path.of(filesJSON));

        Thread.sleep(10000);
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://xray.cloud.getxray.app/api/v2/import/execution/cucumber"))
                .header("Content-Type", "application/json")
                .header("Authorization", " Bearer " + token3)
                .POST(HttpRequest.BodyPublishers.ofString(jsonContent))
                .build();

        try {
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            System.out.println("Response Code: " + response.statusCode());
            System.out.println("Response Body: " + response.body());
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }

    }

}
