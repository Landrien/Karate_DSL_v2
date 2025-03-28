Feature: Création d'un utilisateur avec données JSON externes

  Scenario: Tester la création d'un utilisateur avec un fichier JSON
    Given url 'https://reqres.in'
    And path '/api/users'

    # Charger le fichier JSON externe
    * def requestBody = read('create_user.json')

    # Envoyer une requête POST avec le fichier JSON
    And request requestBody
    When method post
    Then status 201

    # Vérifier que la réponse contient les mêmes valeurs pour 'name' et 'job'
    * match response.name == requestBody.name
    * match response.job == requestBody.job
