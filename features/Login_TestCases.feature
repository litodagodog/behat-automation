#Pre-conditions##
	#Admin user and master user are already created prior in running this script
##variable that can be change/modified##
	# username/password
		# if modified you also need to modify all affected scenarios

@loginFunctionality
Feature: Login Functionality
	As an admin user/Master User
	I will be able to login to my account
	
	Background:
		Given there are following users:
			| username | password   |
			| adminUser    | test123 |
			| masterAccount    | test123 |
			| litoLMA@stage.com   | test123 |
        And I am on "/"
		And I click on login "Client Login"
		
	@adminUser
    Scenario: Login as Admin User
		When I am authenticated as "adminUser"
		Then I should not see "Enter Username or Email and valid password"
		Then I should be on "/admin"
		Then I should see "Clients"
		Then I save a screenshot

	@masterUserRB	
    Scenario: Login as Master User for RB
		When I am authenticated as "masterAccount"
		Then I should not see "Enter Username or Email and valid password"
		And I accept the term of use	
		Then I should be on "/master_account"
		Then I should see text matching "Hi,masterAccount"
		Then I save a screenshot

	@masterUserLMA	
    Scenario: Login as Master User for LMA
		When I am authenticated as "litoLMA@stage.com"
		Then I should not see "Enter Username or Email and valid password"
		And I accept the term of use	
		Then I should be on "/master_account/dealers"
		Then I should see text matching "Hi, litoLMA"
		Then I save a screenshot		
		
		