#Pre-conditions
	#each user onboarding should be done prior in running the script
### variables that can be modified ####
	# username/password of each technician

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
			| employee01@conway.com    | test123 |
			| employee01@lennoxMarktng.com    | test123 |
        		And I am on "/"
		And I click on login "Client Login"
		
	@techRBUser
    Scenario: As an RB-Technician I can Login to my account
		When I am authenticated as "employee01@conway.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		Then I should be on "/employees/?tab=recent"
		Then I should see "YOUR RECENT ACTIVITY"
		Then I save a screenshot
		
	@techRBViewReviews
    Scenario: As an RB-Technician I can View my Reviews
		When I am authenticated as "employee01@conway.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I click on "reviews"
		Then I should be on "/employees/?tab=reviews"
		Then I should see text matching "Site"
		Then I save a screenshot		

	@techRBViewSurveys
    Scenario: As an RB-Technician I can View my Surveys
		When I am authenticated as "employee01@conway.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I click on "surveys"
		Then I should be on "/employees/?tab=surveys"
		Then I should see text matching "Customer"
		Then I save a screenshot

	@techRBViewRewards
    Scenario: As an RB-Technician I can View my Rewards
		When I am authenticated as "employee01@conway.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I click on "rewards"
		Then I should be on "/employees/?tab=rewards"
		Then I should see text matching "Total Points Available"
		Then I save a screenshot

	@techLMAUser
    Scenario: As an LMA-Technician I can Login to my Account
		When I am authenticated as "employee01@lennoxMarktng.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		Then I should be on "/employees/?tab=recent"
		Then I should see "YOUR RECENT ACTIVITY"
		Then I save a screenshot
		
	@techLMAViewReviews
    Scenario: As an LMA-Technician I can View my Reviews
		When I am authenticated as "employee01@lennoxMarktng.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I click on "Reviews"
		Then I should be on "/employees/?tab=reviews"
		Then I should see text matching "Site"
		Then I save a screenshot		

	@techLMAViewSurveys
    Scenario: As an LMA-Technician I can View my Surveys
		When I am authenticated as "employee01@lennoxMarktng.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I click on "Surveys"
		Then I should be on "/employees/?tab=surveys"
		Then I should see text matching "Customer"
		Then I save a screenshot

	@techLMAViewRewards
    Scenario: As an LMA-Technician I can View my Rewards
		When I am authenticated as "employee01@lennoxMarktng.com"
		Then I should not see text matching "Enter Username or Email and valid password"
		When I click on "Rewards"
		Then I should be on "/employees/?tab=rewards"
		Then I should see text matching "Total Points Available"
		Then I save a screenshot