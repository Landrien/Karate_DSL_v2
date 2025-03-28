Feature: Delete test
  Scenario: supprimer un user
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204
    And print response
    * def jsonResponse = response
    * def statusCode = response.statusCode
    * def statusMessage = response.statusMessage
    * def headers = response.headers
    * def body = response.body