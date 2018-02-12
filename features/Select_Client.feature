@SelectClient
Feature: Select client using select2
	As an admin user/Master User
	I will be able to login to my account
	
	Background:
		Given there are following users:
			| username | password   |
			| adminUser    | test123 |
        And I am on "/"
		And I click on login "Client Login"
		
    Scenario: Login as Admin User
		When I am authenticated as "adminUser"
		Then I should not see "Enter Username or Email and valid password"
		Then I should be on "/admin"
		Then I should see "Clients"
		When I fill in select2 input "#select2-clients-select2-container" with "quit" and select "quitters"
		#When I fill in select2 "#select2-clients-select2-container" with "quitters" and wait 10 seconds until results are loaded
		Then I save a screenshot
		