Feature: Réutilisation des scénarios avec call

  # Scénario de création de l'utilisateur
  Scenario: Création d'un utilisateur
    * def user = { name: 'Trinity', job: 'Hacker' }

    Given url 'https://reqres.in'
    And path '/api/users'
    And request user
    When method POST
    Then status 201
    * def id = response
    * set karate-config.id = id
    * print 'Utilisateur créé avec ID:', id

  # Scénario pour supprimer l'utilisateur
  Scenario: Supprimer l'utilisateur créé
    # Appeler le scénario de création d'utilisateur et récupérer l'ID
    * call read('classpath:feature/Exo8.feature')

    # Suppression de l'utilisateur
    Given url 'https://reqres.in'
    And path '/api/users/' + karate-config.id
    When method DELETE
    Then status 204
    * print 'Utilisateur supprimé avec ID:', karate-config.id
