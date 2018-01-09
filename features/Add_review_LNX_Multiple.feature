Feature: Add Reviews
	I will be able to search for a client
	I will be able to select employee
	I will be able to input name and email address
	I will be able to add review
	I will be able to refer

	Scenario Outline: Add buzzbox review without referral
		Given I am on "/"
		When I fill in "home_search_input" with "sampleClient"
		And I press "Go"
		Then I should be on "/search_results?q=sampleClient"
		Then I should see text matching "Best Match"
		When I click on "sampleClient-LNX"
		Then I should be on "/portal/feedback/who_helped_you?bc=1&company=sampleClient-LNX&start=1"
		Then I should see text matching "Who Helped You?"
		When I fill in "Search by first name" with "<employeeName>"
		And I wait for 5 seconds
		And I click on "Continue"
		And I fill in "name_field" with "<customerName>"
		And I fill in "email_field" with "<customerEmail>"
		And I press "Confirm"
		Then I should see text matching "Please Help By Writing A Review Below!"
		When I add "5" star review
		When I fill in "title" with "<reviewTitle>"
		When I fill in "message" with "<reviewFeedback>"
		And I press "Submit"
		Then I should see text matching "If you've enjoyed this experience, please like ReviewBuzz on Facebook below."
		And I wait for 5 seconds
		And I click on "Exit"

	Examples: Review data
		| employeeName | customerName | customerEmail   | reviewTitle | reviewFeedback   |
		| abc | ClientLNXReview001@peter.com   | ClientLNXReview001_title | ClientLNXReview001_feedback   |
		| abc | ClientLNXReview002@peter.com   | ClientLNXReview002_title | ClientLNXReview002_feedback   |		
		| abc | ClientLNXReview003@peter.com   | ClientLNXReview003_title | ClientLNXReview003_feedback   |
		| abc | ClientLNXReview004@peter.com   | ClientLNXReview004_title | ClientLNXReview004_feedback   |
		| abc | ClientLNXReview005@peter.com   | ClientLNXReview005_title | ClientLNXReview005_feedback   |
		| abc | ClientLNXReview006@peter.com   | ClientLNXReview006_title | ClientLNXReview006_feedback   |
		| abc | ClientLNXReview007@peter.com   | ClientLNXReview007_title | ClientLNXReview007_feedback   |
		| abc | ClientLNXReview008@peter.com   | ClientLNXReview008_title | ClientLNXReview008_feedback   |
		| abc | ClientLNXReview009@peter.com   | ClientLNXReview009_title | ClientLNXReview009_feedback   |
		| abc | ClientLNXReview010@peter.com   | ClientLNXReview010_title | ClientLNXReview010_feedback   |				