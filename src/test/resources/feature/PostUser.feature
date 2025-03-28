Feature: Create an user from api

  Scenario: Verify user details
    Given url 'https://reqres.in/api/users'
    And request {name: "morpheus", job : "leader"}
    When method POST
    Then status 201
    And match response.name contains 'morpheus'
    And match response.job == 'leader'
    And match response.id != null
    And print response

