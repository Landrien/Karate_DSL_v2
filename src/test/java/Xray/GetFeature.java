package Xray;

import java.io.*;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class GetFeature {

    public static void unzip(String zipFilePath, String destDir) {
        File dir = new File(destDir);
        if (!dir.exists()) dir.mkdirs(); // Créer le dossier s'il n'existe pas

        try (ZipInputStream zis = new ZipInputStream(new FileInputStream(zipFilePath))) {
            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                File newFile = new File(destDir, entry.getName());

                // Vérifier si c'est un dossier
                if (entry.isDirectory()) {
                    newFile.mkdirs();
                } else {
                    // Créer les dossiers parents si nécessaires
                    new File(newFile.getParent()).mkdirs();

                    // Écrire le fichier
                    try (FileOutputStream fos = new FileOutputStream(newFile)) {
                        byte[] buffer = new byte[1024];
                        int len;
                        while ((len = zis.read(buffer)) > 0) {
                            fos.write(buffer, 0, len);
                        }
                    }
                }
                zis.closeEntry();
            }
            System.out.println("Décompression terminée dans : " + destDir);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void getFeature(String token) throws InterruptedException, IOException {
        String token3 = token.replace("\"", "");
        String FileDownwload = "feature.zip";
        String Ticket = "POEI20252-620";
        Thread.sleep(10000);
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://xray.cloud.getxray.app/api/v2/export/cucumber?keys=" + Ticket))
                .header("Content-Type", "application/json")
                .header("Authorization", " Bearer " + token3)
                .GET()
                .build();

        try {
            HttpResponse<InputStream> response = client.send(request, HttpResponse.BodyHandlers.ofInputStream());

            if (response.statusCode() == 200) {

                try (InputStream inputStream = response.body();
                     FileOutputStream outputStream = new FileOutputStream(FileDownwload)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }

                    unzip("feature.zip", "src/test/resources/feature/import");
                    System.out.println("Feature download;");
                }
            } else {
                System.out.println(response.statusCode());
                System.out.println("Erreur");
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }

}
