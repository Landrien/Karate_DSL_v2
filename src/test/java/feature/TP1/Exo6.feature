Feature: Vérification de la structure JSON
  Scenario: Tester que la réponse GET /api/users/2 correspond au schéma attendu

    Given url 'https://reqres.in'
    And path '/api/users/2'
    When method get
    Then status 200

    * def expectedSchema =
    """
    {
      "data": {
        "id": "#number",
        "email": "#string",
        "first_name": "#string",
        "last_name": "#string",
        "avatar": "#string"
      },
      "support": {
        "url": "#string",
        "text": "#string"
      }
    }
    """

    * match response == expectedSchema
