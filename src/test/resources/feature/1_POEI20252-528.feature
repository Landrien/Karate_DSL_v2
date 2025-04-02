@REQ_POEI20252-528
Feature: Connexion xray karate

	@POEI20252-459 @Hadrien @ParaBank
	Scenario: Connexion Valide ParaBank
		Given L'utilisateur est sur la page de connexion
		When L'utilisateur saisit son username "john"
		And L'utilisateur saisit son password "demo"
		And L'utilisateur clique sur le bouton de connexion
		Then L'utilisateur est redirigé vers la page d'accueil
		
	@POEI20252-530 @Hadrien @ParaBank
	Scenario: Connexion Invalide Parabank
		Scenario: Connexion Invalide
		    Given L'utilisateur est sur la page de connexion
		    When L'utilisateur saisit son username "jjj" invalide
		    And L'utilisateur saisit son password "bbbb" invalide
		    And L'utilisateur clique sur le bouton de connexion
		    Then L'utilisateur reste sur la page de connexion
		
