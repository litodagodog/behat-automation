#Pre-conditions
	# admin credentials already exists in stage
	# if username/password is modified in background
		#you also need to modify all username in all scenario
	# if company name is modified in @createClient
		#you also need to modify all client in all scenario
### variables to modify ####
	# username/password in background
	# company name
	# company contact email

@createTestcases
Feature: Create Test Cases
	As an admin user
	I will be able to create new Client
	I will be able to search the newly created Client
	I will be able to create new client manager user
	I will be able to create new Master user
	I will be able to create new CSR user
	I will be able to create new Technician user
	
	Background:
		Given there are following users:
			| username | password   |
			| adminUser    | test123 |
			| sampleManager002    | test123 |
			| prodtestMaster    | test123 |
			| prodtest8csr    | test123 |
			| prodtest8tech    | test123 |
        And I am on "/"
		And I click on login "Client Login"
	
	@createClientBuzzboxReviewOnly
    Scenario: Create New Client BuzzBox Only
		When I am authenticated as "adminUser"
		And I press on "Add Client" button
		And I fill in "company" with "Auto001NewClient"
		And I check "options[send_as_feature]"
		And I fill in "contact_email" with "Auto001NewClient@stage.com"
		#And I check "buzzbox-title-on-client-dashboard"
		#And I check "buzzbox-title-on-portal"
		#And I check "buzzbox-title-on-public-pages"
		And I check "buzzbox-review-only"
		When I press "submit_client_form"
		Then I should not see "Error: company with such name already exists in the database"
		Then I save a screenshot

	@searchClient
	Scenario: Search for the newly created Client
		When I am authenticated as "adminUser"
		And I fill in "keywords" with "Auto001NewClient"
		And I press "Search"
		Then I should see the newly created client "Auto001NewClient"
		Then I save a screenshot
		
	@createClientManager
	Scenario: Create Client Manager User
		When I am authenticated as "adminUser"
		And I hover on "Client Management"
		And I click on "Manage User Accounts"
		And I click on "Add User"
		And I fill in "username" with "sampleManager002"
		And I fill in "email" with "sampleManager002@staging.com"
		And I fill in "password" with "test123"
		And I fill in "password_confirm" with "test123"
		#And I select "Auto001NewClient" from "clients_id"
		And I fill in select2 input "#select2-client-select2-container" with "sample" and select "sampleClient001"
		And I select "client" from "memberships"
		When I press "Save"
		Then I should not see text matching "The username you entered"
		Then I save a screenshot	
		
	@loginAsClientManager
	Scenario: Login as new Client Manager User
		When I am authenticated as "sampleManager002"
		And I accept the term of use
		#When I click on "Dashboard Manager Pro"
		Then I should be on "/clients/reviews"
		When I see welcome message I will close it
		Then I save a screenshot
		
	@createMasterUser
	Scenario: Create Master User
		When I am authenticated as "adminUser"
		And I hover on "Client Management"
		And I click on "Manage Master Users"
		And I click on "Add User"
		And I fill in "username" with "prodtestMaster"
		And I fill in "email" with "prodtestMaster@stage.com"
		And I fill in "password" with "test123"
		And I fill in "password_confirm" with "test123"
		When I press "Save"
		Then I should not see text matching "The username is"
		Then I save a screenshot	
		
	@loginAsMasterUser
	Scenario: Login as new Master User
		When I am authenticated as "prodtestMaster"
		And I accept the term of use	
		Then I should be on "/master_account"
		Then I should see text matching "Hi,prodtestMaster"
		Then I save a screenshot

	@createCSRUser
	Scenario: Create CSR User
		When I am authenticated as "adminUser"
		And I hover on "Client Management"
		And I click on "Manage User Accounts"
		And I click on "Add User"
		And I fill in "username" with "prodtest8csr"
		And I fill in "email" with "prodtest8csr@stage.com"
		And I fill in "password" with "test123"
		And I fill in "password_confirm" with "test123"
		And I fill in select2 input "#select2-client-select2-container" with "sample" and select "sampleClient001"
		And I select "csr" from "memberships"
		When I press "Save"
		Then I should not see text matching "The username you entered"
		Then I save a screenshot	
		
	@loginAsCSRUser
	Scenario: Login as new CSR User
		When I am authenticated as "prodtest8csr"
		And I accept the term of use	
		Then I should be on "/clients/feedback_requests/"
		Then I should see text matching "Customer List"
		Then I save a screenshot

	@createTechUser
	Scenario: Create Technician User
		When I am authenticated as "adminUser"
		And I hover on "Client Management"
		And I click on "Manage User Accounts"
		And I click on "Add User"
		And I fill in "username" with "prodtest8tech"
		And I fill in "email" with "prodtest8tech@stage.com"
		And I fill in "password" with "test123"
		And I fill in "password_confirm" with "test123"
		And I fill in select2 input "#select2-client-select2-container" with "sample" and select "sampleClient001"
		And I select "technician" from "memberships"
		When I press "Save"
		Then I should not see text matching "The username you entered"
		Then I save a screenshot	
		
	@SearchTechUser
	Scenario: Search if Technician User is created
		When I am authenticated as "adminUser"
		And I hover on "Client Management"
		And I click on "Manage User Accounts"
		And I fill in "keywords" with "prodtest8tech"
		When I press "Search"
		Then I should see the newly created user "prodtest8tech"
		Then I save a screenshot