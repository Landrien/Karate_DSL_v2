Feature: Test de création d'utilisateur avec fichier JSON externe

  Scenario: Lire un fichier JSON et vérifier la réponse POST

    # Lire et charger le fichier JSON externe
    * def requestBody = read('user.json')

    # Envoyer une requête POST avec les données du fichier JSON
    Given url 'https://reqres.in'
    And path '/api/users'
    And request requestBody
    When method post
    Then status 201  # Vérifier que le statut est 201 Created

    # Vérifier que la réponse contient un ID généré
    * match response.id != null
    * print 'Utilisateur créé avec l\'ID:', response.id
