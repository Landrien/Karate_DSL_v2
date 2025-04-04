Feature: Test Get
  Scenario: test
    Given url "https://restful-booker.herokuapp.com"
    And path "/booking"
   # And header Accept = 'application/json'
    When method GET
    Then status 200
    * match response != null

