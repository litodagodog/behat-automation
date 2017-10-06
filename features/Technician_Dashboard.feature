@technicianDashboard
Feature: Technician Dashboard Test Cases
	As an Technician user for RB or LMA
	I will be able to login to my account
	I will be able to view my Recent Activity
	I will be able to view my reviews
	I will be able to view my surveys
	I will be able to view my rewards
	
	Background:
		Given there are following users:
			| username | password   |
			| litotech@behatclient001.com    | test123 |
			| newtech@sprint6client.com    | test123 |
        		And I am on "/"
		And I click on login "Client Login"
		
	@techRBUser
    Scenario: RB_Login as technician user
		When I am authenticated as "litotech@behatclient001.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		Then I should be on "/employees/?tab=recent"
		Then I should see "YOUR RECENT ACTIVITY"
		Then I save a screenshot
		
	@techRBViewReviews
    Scenario: RB_View my Reviews
		When I am authenticated as "litotech@behatclient001.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I click on "reviews"
		Then I should be on "/employees/?tab=reviews"
		Then I should see text matching "Site"
		Then I save a screenshot		

	@techRBViewSurveys
    Scenario: RB_View my Surveys
		When I am authenticated as "litotech@behatclient001.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I click on "surveys"
		Then I should be on "/employees/?tab=surveys"
		Then I should see text matching "Customer"
		Then I save a screenshot

	@techRBViewRewards
    Scenario: RB_View my Rewards
		When I am authenticated as "litotech@behatclient001.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I click on "rewards"
		Then I should be on "/employees/?tab=rewards"
		Then I should see text matching "Total Points Available"
		Then I save a screenshot

	@techLMAUser
    Scenario: LMA_Login as technician user
		When I am authenticated as "newtech@sprint6client.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		Then I should be on "/employees/?tab=recent"
		Then I should see "YOUR RECENT ACTIVITY"
		Then I save a screenshot
		
	@techLMAViewReviews
    Scenario: LMA_View my Reviews
		When I am authenticated as "newtech@sprint6client.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I click on "Reviews"
		Then I should be on "/employees/?tab=reviews"
		Then I should see text matching "Site"
		Then I save a screenshot		

	@techLMAViewSurveys
    Scenario: LMA_View my Surveys
		When I am authenticated as "newtech@sprint6client.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I click on "Surveys"
		Then I should be on "/employees/?tab=surveys"
		Then I should see text matching "Customer"
		Then I save a screenshot

	@techLMAViewRewards
    Scenario: LMA_View my Rewards
		When I am authenticated as "newtech@sprint6client.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I click on "Rewards"
		Then I should be on "/employees/?tab=rewards"
		Then I should see text matching "Total Points Available"
		Then I save