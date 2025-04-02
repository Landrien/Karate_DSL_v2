Feature: Export message
  Background: Recup du token
    Given url "https://xray.cloud.getxray.app/api/v2/authenticate"
    And request {client_id: "723565485D034E88A38F489D94D11E17",client_secret: "49061d773899f0f538536b49bc60d517787c8c591d3f68efab6de36728aa8761"}
    And header Content-Type = 'application/json'
    When method post
    Then status 200
    * def token = response

    Scenario: Export
      Given url "https://xray.cloud.getxray.app/api/v2/import/execution/cucumber"
      And header Content-Type = 'application/json'
      And header Authorization = 'Bearer ' + "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZW5hbnQiOiJiNmNhZGQwNS1lMzQxLTNmMTctYjU1Zi00OTM0MTI4MWQ4MmEiLCJhY2NvdW50SWQiOiI3MTIwMjA6YTM0ZTZiNDMtY2M2Ny00MmQ1LWIwNGEtNTQxYjk5MWMyNzFjIiwiaXNYZWEiOmZhbHNlLCJpYXQiOjE3NDM0MjcxMjgsImV4cCI6MTc0MzUxMzUyOCwiYXVkIjoiNzIzNTY1NDg1RDAzNEU4OEEzOEY0ODlEOTREMTFFMTciLCJpc3MiOiJjb20ueHBhbmRpdC5wbHVnaW5zLnhyYXkiLCJzdWIiOiI3MjM1NjU0ODVEMDM0RTg4QTM4RjQ4OUQ5NEQxMUUxNyJ9.j9OcRe2XgBv4Is6RU8UY5_4xXQaq8N70niymchYNbAQ"
      And request read("cucumber.json")
      When method post