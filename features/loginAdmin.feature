Feature: Login as Admin Credentials
    As an admin user
    I will be able to login to my account

    Scenario: Open site and login as admin
        Given I am on "/"
		When I click on login "Client Login"
		And I wait for "5"
		When I fill in "username" with "lito.dagodog"
		When I fill in "password" with "Y493SrNV"
		When I click the loginAdmin "Log in"
		And I wait for "8"
		Then I should be on "/admin"
		Then I should see "Clients"
		#Then I save a screenshot to "Admin_Account.png"
		
	Scenario: Logout admin account
        #Given I am on "/admin"
		When I click on logout "logout"
		And I wait for "5"
		Then I should be on "/"
		Then I should see "Start Your Review Here!"
		#Then I save a screenshot to "logoutAdmin.png"
		