Feature: Search for a Client
    In order to see a specific client
    As a website user
    I need to be able to search for a client

    Scenario: Searching for a client
        Given I am on "/"
		#And  I set browser window size to "1366" x "768"
		When I fill in "home_search_input" with "Tactics"
		When I press "home_go_button"
		Then I should see "Tactics"


    Scenario: Click the specific client
        Given I am on "/search_results?q=tactics"
		#And  I set browser window size to "1366" x "768"
		#When I fill in "home_search_input" with "tactics"
		When I click on text "Tactics"
		Then I should see "Who Helped You?"		