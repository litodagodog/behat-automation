Feature: create New Client
    As an admin user
    I will be able to create new Client
	Background:
		Given there are following users:
			| username | password   |
			| lito.dagodog    | Y493SrNV |
			| employee01    | test123 |
			| csr01    | test123 |
			| tech01    | test123 |
        Given I am on "/"
		When I click on login "Client Login"
		And I wait for "3" seconds		
    Scenario: Create new Client
		Given I am authenticated as "lito.dagodog"
		And I wait for "3" seconds
		When I press on "Add Client" button
		And I wait for "3" seconds
		When I fill in "company" with "behatClient001"
		When I check "options[send_as_feature]"
		When I fill in "contact_email" with "behatClient001@stage.com"
		When I press "submit_client_form"
		Then I should not see "Error: company with such name already exists in the database"
		#Then I should be on "/admin"
	Scenario: Search for the newly created Client
		Given I am authenticated as "lito.dagodog"
		And I wait for "3" seconds
		When I fill in "keywords" with "behatClient001"
		When I press "Search"
		Then I should see "Company Name"
		Then I should see "behatClient001"
		
	Scenario: Create new Client Manager
		Given I am authenticated as "employee01"
		And I wait for "5" seconds
		Then I should be on "/clients/reviews"
		Then print current URL
		#Then I should see "Clients"
		