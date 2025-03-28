Feature: Test Api Get
  Scenario: Recup d'info
    Given url "https://jsonplaceholder.typicode.com/"
    And request "/posts/1"
    When method GET 
    Then status 200
    And match response.title=='sunt aut facere repellat provident occaecati excepturi optio reprehenderit'
    And match response.id=='1'
