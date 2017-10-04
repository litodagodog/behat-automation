Feature: Post Review Funtionality
	As a reviewer
	I will be able to search for a client
	I will be able to post reviews using BB
	I will be able to post reviews on Single Site
	I will be able to view my reviews on company site
	
	@searchClient
    Scenario: Searching for a client
        Given I am on "/"
		When I fill in "home_search_input" with "behatClient001"
		And I press "home_go_button"
		Then I should see text matching "behatClient001"

	@clickClient
    Scenario: Click the specific client
        Given I am on "/search_results?q=behatClient001"
		And I click on text "behatClient001"
		Then I should see "Who Helped You?"

	@addReview
    Scenario: Select an employee and add review
        Given I am on "/portal/feedback/who_helped_you?bc=1&company=behatClient001&start=1"
		And I click on employee "Grace"
		Then I should see text matching "You have selected: Grace"
		And I click on "Continue"
		Then I should see "You're Helping:"
		And I fill in "name_field" with "review001 review001"
		And I fill in "email_field" with "review001@review001.com"
		And I click on "Confirm"
		And I add "5" star review
		And I fill in "title" with "review001 title"
		And I fill in "message" with "5 star review"
		When I click on "Submit"
		Then I should see text matching "Thanks & Goodbye!"
		