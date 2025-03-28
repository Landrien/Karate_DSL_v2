Feature: MaJ reservation

  Scenario: Test POST

    * def reserve =
  """
  {
  "firstname": "Pierre",
  "lastname": "Martin",
  "totalprice": 150,
  "depositpaid": true,
  "bookingdates": {
  "checkin": "2024-05-01",
  "checkout": "2024-05-05"
  },
  "additionalneeds": "Petit déjeuner"
  }
    """

    Given url "https://restful-booker.herokuapp.com"
    And path "/booking"
    And request reserve
    And header Accept = 'application/json'
    When method post
    Then status 200
    * match response.bookingid != null
    * def price = response.totalprice
    * karate.call({ price: price})



  Scenario: PUT Test
    * def result = call read('classpath:feature2/Exo4.feature')
    * def price = result.price
    Given url "https://restful-booker.herokuapp.com"
    And path "/booking"
    And request { totalprice: price }
    When method put
    Then status 200
