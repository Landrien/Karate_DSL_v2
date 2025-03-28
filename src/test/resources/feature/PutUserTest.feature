Feature: Test Put
  Scenario: Mettre à jour un user
    Given url 'https://reqres.in/api/users/2'
    And request {name: "morpheus", job : "zion resident"}
    When method PUT
    Then status 200
    And match response.name == 'morpheus'
    And match response.job == 'zion resident'
    And match response.updatedAt != null
    And print response