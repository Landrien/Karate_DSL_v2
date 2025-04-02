Feature: Create an user from api

  Scenario Outline: Verify user details
    Given url 'https://reqres.in/api/users'
    And request {name: <name>, job : <job>}
    When method POST
    Then status 201
    And match response.name contains "/<name>/"
    And match response.job == "/<job>/"
    And match response.id != null
    And print response

    Examples:
      | name     | job    |
      | morpheus | leader |
      | Lily     | RH     |

