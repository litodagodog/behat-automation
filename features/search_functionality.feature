Feature: Search for a Client
    As a website user
    I will be able to search for a client

    Scenario: Searching for a client
        Given I am on "/"
		When I fill in "home_search_input" with "tactics"
		And I press "home_go_button"
		Then I should see text matching "tactics"