#Pre-conditions
	#CSR users for RB and LMA should exists in selected client
	#term of use is already accepted before running the script
	#Enable Review Request should be enabled
### variables that can be modified based on selected client ###
    ### username/password of all used scenario
	### @CSRRBReplyBuzzboxReview ###
	#Reply content (Line 98 and Line 101)
	### @CSRRBFeedbackRequests ####
	#Customer data(Lines 114-116)
	#Date (Line 119)
	#Employee(Line 120)
	### @CSRRBReviewRequests ####
	#Customer email addresses(Line 137)
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
			| CSRForPeterPiper2@PeterPiper2.com    | test123 |
			| Employee014Quitter@stage.com    | test123 |
        And I am on "/"
		And I click on login "Client Login"
		
	@CSRRBUser
    Scenario: As an CSR I can Login to my account
		When I am authenticated as "CSRForPeterPiper2@PeterPiper2.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		Then I should be on "/clients/feedback_requests/"
		Then I should see "Customer List"
		Then I save a screenshot
		
	@CSRViewRecentActivity
    Scenario: As an CSR I can View my Recent Activity
		When I am authenticated as "CSRForPeterPiper2@PeterPiper2.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "Recent Activity"
		Then I should be on "/csr_profile/?tab=recent"
		Then I should see text matching "YOUR RECENT ACTIVITY"
		Then I save a screenshot		
		
	@CSRViewReviews
    Scenario: As an CSR I can View My Reviews
		When I am authenticated as "CSRForPeterPiper2@PeterPiper2.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Reviews"
		Then I should be on "/csr_profile/?tab=reviews"
		Then I should see text matching "Site"
		Then I save a screenshot		

	@CSRRBViewSurveys
    Scenario: As an CSR I can View My Surveys
		When I am authenticated as "CSRForPeterPiper2@PeterPiper2.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Surveys"
		Then I should be on "/csr_profile/?tab=surveys"
		Then I should see text matching "Customer"
		Then I save a screenshot

	@CSRRBViewRewards
    Scenario: As an CSR I can View My Rewards
		When I am authenticated as "CSRForPeterPiper2@PeterPiper2.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Rewards"
		Then I should be on "/csr_profile/?tab=rewards"
		Then I should see text matching "Total Points Available"
		Then I save a screenshot

	@CSRRBReplyBuzzboxReview
    Scenario: As an CSR I can Reply to Buzzbox Review
		When I am authenticated as "CSRForPeterPiper2@PeterPiper2.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Reviews"
		Then I should be on "/csr_profile/?tab=reviews"
		And I replied "Review Replied 305" on any buzzbox review
		And I wait for 5 seconds
		Then I should see text matching "Review Replied 305"
		Then I save a screenshot
		
	@CSRRBFeedbackRequests
    Scenario: As an CSR I can Send Feedback Request
		When I am authenticated as "CSRForPeterPiper2@PeterPiper2.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Manage"
		And I click on "Feedback Requests"
		Then I should be on "/clients/feedback_requests"
		Then I should see text matching "Search for customer"
		When I click on "+ Add"
		Then I should see text matching "Enter Customer Data"
		And I fill in "form_first_name" with "customer005"
		And I fill in "form_last_name" with "customer005"
		And I fill in "form_email" with "customer005@customer005.com"
		And I click on "Show Calendar"
		And I select date "October 27, 2017"
		And I fill in "team_users_names[]" with "CSRForPeterPiper2"
		And I click on "Continue"
		Then I should be on "clients/feedback_requests?type=pending&success=request_added"
		Then I should see "Send Meet the team Email" button
		Then I save a screenshot

	@CSRRBReviewRequests
    Scenario: As an CSR I can Send Review Requests
		When I am authenticated as "CSRForPeterPiper2@PeterPiper2.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Manage"
		And I click on "Review Requests"
		Then I should be on "/clients/review_requests"
		Then I should see text matching "Request Reviews"
		And I fill in "emails" with "customer005,customer005"
		When I click on "Send"
		Then I should see text matching "Incorrectly formatted email"
		And I fill in "emails" with "customer005@customer005.com,customer005@customer005.com"
		When I click on "Send"
		Then I should see text matching "Feedback Requested"
		Then I save a screenshot			

	@LMARBUser
    Scenario: As an CSR-LMA I can Login to my Account
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		Then I should be on "/clients/feedback_requests/"
		Then I should see "Customer List"
		Then I save a screenshot
		
	@LMAViewRecentActivity
    Scenario: As an CSR-LMA I can View my Recent Activity
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "Recent Activity"
		Then I should be on "/csr_profile/?tab=recent"
		Then I should see text matching "YOUR RECENT ACTIVITY"
		Then I save a screenshot		
		
	@LMAViewReviews
    Scenario: As an CSR-LMA I can View my Reviews
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Reviews"
		Then I should be on "/csr_profile/?tab=reviews"
		Then I should see text matching "Site"
		Then I save a screenshot		

	@LMARBViewSurveys
    Scenario: As an CSR-LMA I can View my Surveys
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Surveys"
		Then I should be on "/csr_profile/?tab=surveys"
		Then I should see text matching "Customer"
		Then I save a screenshot

	@LMARBViewRewards
    Scenario: As an CSR-LMA I can View my Rewards
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Rewards"
		Then I should be on "/csr_profile/?tab=rewards"
		Then I should see text matching "Total Points Available"
		Then I save a screenshot

	@LMARBReplyBuzzboxReview
    Scenario: As an CSR-LMA I can Reply to Buzzbox Review
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Feedback"
		And I click on "My Reviews"
		Then I should be on "/csr_profile/?tab=reviews"
		And I replied "Review Replied 305" on any buzzbox review
		And I wait for 5 seconds
		Then I should see text matching "Review Replied 305"
		Then I save a screenshot
		
	@LMARBFeedbackRequests
    Scenario: As an CSR-LMA I can Send Feedback Request
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Manage"
		And I click on "Feedback Requests"
		Then I should be on "/clients/feedback_requests"
		Then I should see text matching "Search for customer"
		When I click on "+ Add"
		Then I should see text matching "Enter Customer Data"
		And I fill in "form_first_name" with "customer005"
		And I fill in "form_last_name" with "customer005"
		And I fill in "form_email" with "customer005@customer005.com"
		And I click on "Show Calendar"
		And I select date "October 27, 2017"
		And I fill in "team_users_names[]" with "Employee014Quitter"
		And I click on "Continue"
		Then I should be on "clients/feedback_requests?type=pending&success=request_added"
		Then I should see "Send Meet the team Email" button
		Then I save a screenshot

	@LMARBReviewRequests
    Scenario: As an CSR-LMA I can Send Review Requests
		When I am authenticated as "Employee014Quitter@stage.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I hover on "Manage"
		And I click on "Review Requests"
		Then I should be on "/clients/review_requests"
		Then I should see text matching "Request Reviews"
		And I fill in "emails" with "customer005,customer005"
		When I click on "Send"
		Then I should see text matching "Incorrectly formatted email"
		And I fill in "emails" with "customer005@customer005.com,customer005@customer005.com"
		When I click on "Send"
		Then I should see text matching "Feedback Requested"
		Then I save a screenshot