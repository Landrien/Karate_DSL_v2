Feature: Reservation

  Scenario: Test Get
    Given url "https://restful-booker.herokuapp.com"
    And path "/booking/1"
    And header Accept = 'application/json'
    When method get
    Then status 200
    * match response.firstname != null
    * match response.lastname != null
    * match response.totalprice != null
