Feature: Add Reviews
	I will be able to search for a client
	I will be able to select employee
	I will be able to input name and email address
	I will be able to add review
	I will be able to refer

	Scenario Outline: Add multiple buzzbox review without referral
		Given I am on "/"
		When I fill in "home_search_input" with "peter piper"
		And I press "Go"
		Then I should be on "/search_results?q=peter+piper"
		Then I should see text matching "Best Match"
		When I click on "Peter Piper Plumbing"
		Then I should be on "/portal/feedback/who_helped_you?bc=1&company=PeterPiperPlumbing&start=1"
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
		| OSX | PeterReview003@peter.com   | PeterReview003_title | PeterReview003_feedback   |
		| OSX | PeterReview004@peter.com   | PeterReview004_title | PeterReview004_feedback   |		
		| OSX | PeterReview005@peter.com   | PeterReview005_title | PeterReview005_feedback   |
		| OSX | PeterReview006@peter.com   | PeterReview006_title | PeterReview006_feedback   |
		| OSX | PeterReview007@peter.com   | PeterReview007_title | PeterReview007_feedback   |
		| OSX | PeterReview008@peter.com   | PeterReview008_title | PeterReview008_feedback   |
		| OSX | PeterReview009@peter.com   | PeterReview009_title | PeterReview009_feedback   |
		| OSX | PeterReview010@peter.com   | PeterReview010_title | PeterReview010_feedback   |
		| OSX | PeterReview011@peter.com   | PeterReview011_title | PeterReview011_feedback   |
		| OSX | PeterReview012@peter.com   | PeterReview012_title | PeterReview012_feedback   |
