Feature: Tests_Reqres

	#{{Scenario Outline: Verify user details}}
	@POEI20252-616 @Hadrien @Reqres
	Scenario Outline: PostUser_Reqres
		Given url 'https://reqres.in/api/users'
		And request {name: <name>, job : <job>}
		When method POST
		Then status 201
		And match response.name == "<name>"
		And match response.job == "<job>"
		And match response.id != null
		And print response
		
		   Examples:
		     | name     | job    |
		     | morpheus | leader |
		     | Lily     | RH     |
		
	#Scenario: récupérer un fichier JSON
	@POEI20252-608 @Hadrien
	Scenario: GetUser_Reqres
		Given url "https://reqres.in"
		And path "/api/users/2"
		When method get
		Then status 200
		And print response
		* def jsonResponse = response
		
