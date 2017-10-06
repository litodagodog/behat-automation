#Pre-conditions
	#CSR users for RB and LMA should exists in selected client
### variables that can be modified based on selected client ###
	### @CSRRBReplyBuzzboxReview ###
	#Reply content (Line 98 and Line 101)
	### @CSRRBFeedbackRequests ####
	#Customer data(Lines 114-116)
	#Date (Line 118)
	#Employee(Line 119)
	### @CSRRBReviewRequests ####
	#Customer email addresses(Line 136)
	####################################
	### @LMARBReplyBuzzboxReview ###
	#Reply content (Line 197 and Line 200)
	### @LMARBFeedbackRequests ####
	#Customer data(Lines 213-215)
	#Date (Line 217)
	#Employee(Line 218)
	### @LMARBReviewRequests ####
	#Customer email addresses(Line 235)	

@CSRDashboard
Feature: CSR Dashboard Test Cases
	As an CSR user for RB or LMA
	I will be able to login to my account
	I will be able to view my Recent Activity
	I will be able to view my reviews
	I will be able to view my surveys
	I will be able to view my rewards
	I will be able to reply to buzzbox reviews
	I will be able to send feedback_requests
	I will be able to send review request
	
	Background:
		Given there are following users:
			| username | password   |
			| employee02@tactics.com    | test123 |
			| Employee014Quitter@stage.com    | test123 |
        And I am on "/"
		And I click on login "Client Login"
		
	@CSRRBUser
    Scenario: RB_Login as CSR user
		When I am authenticated as "employee02@tactics.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		Then I should be on "/clients/feedback_requests/"
		Then I should see "Customer List"
		Then I save a screenshot
		
	@CSRViewRecentActivity
    Scenario: RB_CSR_View my Recent Activity
		When I am authenticated as "employee02@tactics.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "Recent Activity"
		Then I should be on "/csr_profile/?tab=recent"
		Then I should see text matching "YOUR RECENT ACTIVITY"
		Then I save a screenshot		
		
	@CSRViewReviews
    Scenario: RB_CSR_View my Reviews
		When I am authenticated as "employee02@tactics.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Reviews"
		Then I should be on "/csr_profile/?tab=reviews"
		Then I should see text matching "Site"
		Then I save a screenshot		

	@CSRRBViewSurveys
    Scenario: RB_CSR_View my Surveys
		When I am authenticated as "employee02@tactics.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Surveys"
		Then I should be on "/csr_profile/?tab=surveys"
		Then I should see text matching "Customer"
		Then I save a screenshot

	@CSRRBViewRewards
    Scenario: RB_CSR_View my Rewards
		When I am authenticated as "employee02@tactics.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Rewards"
		Then I should be on "/csr_profile/?tab=rewards"
		Then I should see text matching "Total Points Available"
		Then I save a screenshot

	@CSRRBReplyBuzzboxReview
    Scenario: RB_CSR_Reply Buzzbox Reviews
		When I am authenticated as "employee02@tactics.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Reviews"
		Then I should be on "/csr_profile/?tab=reviews"
		When I click on "Reply"
		And I replied "Review Replied 001" on review
		And I click on "SAVE"
		And I wait for "5" seconds
		Then I should see text matching "Review Replied 001"
		Then I save a screenshot
		
	@CSRRBFeedbackRequests
    Scenario: RB_CSR_Feedback Requests
		When I am authenticated as "employee02@tactics.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Manage"
		And I click on "Feedback Requests"
		Then I should be on "/clients/feedback_requests"
		Then I should see text matching "Search for customer"
		When I click on "+ Add"
		Then I should see text matching "Enter Customer Data"
		And I fill in "form_first_name" with "customer002"
		And I fill in "form_last_name" with "customer002"
		And I fill in "form_email" with "customer002@customer002.com"
		And I click on "Show Calendar"
		And I select date "October 06, 2017"
		And I fill in "team_users_names[]" with "employee02"
		And I click on "Continue"
		Then I should be on "clients/feedback_requests?type=pending&success=request_added"
		Then I should see "Send Meet the team Email" button
		Then I save a screenshot

	@CSRRBReviewRequests
    Scenario: RB_CSR_Review Requests
		When I am authenticated as "employee02@tactics.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Manage"
		And I click on "Review Requests"
		Then I should be on "/clients/review_requests"
		Then I should see text matching "Request Reviews"
		And I fill in "emails" with "customer001,customer002"
		When I click on "Send"
		Then I should see text matching "Incorrectly formatted email"
		And I fill in "emails" with "customer001@customer001.com,customer002@customer002.com"
		When I click on "Send"
		Then I should see text matching "Feedback Requested"
		Then I save a screenshot			

	@LMARBUser
    Scenario: LMA_Login as CSR user
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		Then I should be on "/clients/feedback_requests/"
		Then I should see "Customer List"
		Then I save a screenshot
		
	@LMAViewRecentActivity
    Scenario: LMA_CSR_View my Recent Activity
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "Recent Activity"
		Then I should be on "/csr_profile/?tab=recent"
		Then I should see text matching "YOUR RECENT ACTIVITY"
		Then I save a screenshot		
		
	@LMAViewReviews
    Scenario: LMA_CSR_View my Reviews
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Reviews"
		Then I should be on "/csr_profile/?tab=reviews"
		Then I should see text matching "Site"
		Then I save a screenshot		

	@LMARBViewSurveys
    Scenario: LMA_CSR_View my Surveys
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Surveys"
		Then I should be on "/csr_profile/?tab=surveys"
		Then I should see text matching "Customer"
		Then I save a screenshot

	@LMARBViewRewards
    Scenario: LMA_CSR_View my Rewards
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Rewards"
		Then I should be on "/csr_profile/?tab=rewards"
		Then I should see text matching "Total Points Available"
		Then I save a screenshot

	@LMARBReplyBuzzboxReview
    Scenario: LMA_CSR_Reply Buzzbox Reviews
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Reviews"
		Then I should be on "/csr_profile/?tab=reviews"
		When I click on "Reply"
		And I replied "Review Replied 004" on review
		And I click on "SAVE"
		And I wait for "5" seconds
		Then I should see text matching "Review Replied 004"
		Then I save a screenshot
		
	@LMARBFeedbackRequests
    Scenario: LMA_CSR_Feedback Requests
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Manage"
		And I click on "Feedback Requests"
		Then I should be on "/clients/feedback_requests"
		Then I should see text matching "Search for customer"
		When I click on "+ Add"
		Then I should see text matching "Enter Customer Data"
		And I fill in "form_first_name" with "customer002"
		And I fill in "form_last_name" with "customer002"
		And I fill in "form_email" with "customer002@customer002.com"
		And I click on "Show Calendar"
		And I select date "October 06, 2017"
		And I fill in "team_users_names[]" with "Employee014Quitter"
		And I click on "Continue"
		Then I should be on "clients/feedback_requests?type=pending&success=request_added"
		Then I should see "Send Meet the team Email" button
		Then I save a screenshot

	@LMARBReviewRequests
    Scenario: LMA_CSR_Review Requests
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Manage"
		And I click on "Review Requests"
		Then I should be on "/clients/review_requests"
		Then I should see text matching "Request Reviews"
		And I fill in "emails" with "customer001,customer002"
		When I click on "Send"
		Then I should see text matching "Incorrectly formatted email"
		And I fill in "emails" with "customer001@customer001.com,customer002@customer002.com"
		When I click on "Send"
		Then I should see text matching "Feedback Requested"
		Then I save a screenshot