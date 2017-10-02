Feature: Search for a Client
    As a website user
    I need to be able to search for a client

    Scenario: Searching for a client
        Given I am on "/"
		When I fill in "home_search_input" with "quitters"
		When I press "home_go_button"
		Then I should see "quitters"

    Scenario: Click the specific client
        Given I am on "/search_results?q=quitters"
		When I click on text "quitters"
		Then I should see "Who Helped You?"