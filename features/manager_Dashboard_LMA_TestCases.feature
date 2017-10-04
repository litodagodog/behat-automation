Feature: Client Manager Dashboard Functionality
	As an Client Manager User
	I will be able to Create Technician
	I will be able to Create CSR
	I will be able to Delete Technician
	I will be able to Delete CSR
	I will be able to Search for reviews
	I will be able to Pick Feature Review
	I will be able to Download Brag book
	I will be able to Download reviews in Excel
	I will be able to Delete Review
	I will be able to Undelete Review
	I will be able to Reply to Buzzbox
	I will be able to Search for surveys
	I will be able to View survey Data
	I will be able to Preview Template
	I will be able to Send Review Request
	I will be able to Send Review Request for feedback
	I will be able to Send Survey Request for feedback
	I will be able to Preview Template
	I will be able to Preview Template
	
	Background:
		Given there are following users:
			| username | password   |
			| CSRAccount    | test123 |
        And I am on "/"
		And I click on login "Client Login"
			
	@loginAsCSRUser
	Scenario: Login as CSR user
		When I am authenticated as "CSRAccount"
		And I accept the term of use	
		Then I should be on "/master_account"
		Then I should see text matching "Hi,masterAccount"
		Then I save a screenshot		