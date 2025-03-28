Feature: Scénario réutilisable pour créer un utilisateur

  Scenario: Créer un utilisateur et retourner son ID

  * def user = { name: 'Trinity', job: 'Hacker' }

    Given url 'https://reqres.in/'
    And path '/api/users'
    And request user
    And header Content-Type = 'application/json'
    When method post
    Then status 201


  * def createdId = response.id