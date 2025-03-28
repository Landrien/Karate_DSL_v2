Feature: Get user details from Reqres API

  Scenario: récupérer un fichier JSON
    Given url "https://reqres.in"
    And path "/api/users/2"
    When method get
    Then status 200
    And print response
    * def jsonResponse = response