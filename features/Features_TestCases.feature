### client use for LNX review Publicly: sampleClient-LNX services ###
### Client manager : sampleClient-LNX
### CSR : sampleClient-LNX
### Tech : sampleClient-LNX
### VARIABLES to modify before running the scripts
## @EditReply
## @HideReply
## @ShowReply


@FeatureTestCases
Feature: Login Functionality
	As an admin user
	I will be able to login to my account
	I will be able to configure Lennox features
	I will be able to configure RB features
	
	Background:
		Given there are following users:
			| username | password   |
			| adminUser    | test123 |
			| sampleManagerLNX@stage.com    | test123 |
			| litoLMA    | test123 |
			| sampleCSRLNX@stage.com    | test123 |
			| sampleTechLNX@stage.com    | test123 |

		
	@DisplayLNXReviewPubliclyDisabled	
    Scenario: Display Lennox Reviews Publicly options is disabled
        And I am on "/"
    	And I click on login "Client Login"
		When I am authenticated as "adminUser"
		Then I should not see "Enter Username or Email and valid password"
		Then I should be on "/admin"
		Then I should see "Clients"
		When I fill in "keywords" with "sampleClient-LNX"
		And I click on "Search"
		And I click on "edit"
		And I click on "Lennox"
		And I uncheck "clients[options][lennox_opted_in]"
		And I click on "Save"	
		Then the "clients[options][lennox_opted_in]" checkbox should not be checked		
		Then I save a screenshot
		And I wait for 5 seconds
	@clientPublicPage
    Scenario: Client direct public page single sites only	
		Given I am on "/sampleClient-LNX"
		Then I should only see Single Sites Reviews on public pages		
		Then I save a screenshot
	@clientWidgetPage
    Scenario: Client web widget public page single sites only	
		Given I am on "/web-widget/sampleClient-LNX"
		Then I should only see Single Sites Reviews on public pages
		Then I save a screenshot
	@clientBuzzPage
    Scenario: Client buzz public page single sites only	
		Given I am on "/buzz/sampleClient-LNX"
		Then I should see text matching "No Reviews Posted"
		Then I save a screenshot
	@clientReviewCounts
    Scenario: Total Review Count for single sites only
		Given I am on "/web-widget/sampleClient-LNX"
		Then I should have total reviews
		Then I save a screenshot		

	@DisplayLNXReviewPubliclyEnabled	
    Scenario: Display Lennox Reviews Publicly options is enabled
        And I am on "/"
    	And I click on login "Client Login"
		When I am authenticated as "adminUser"
		Then I should not see "Enter Username or Email and valid password"
		Then I should be on "/admin"
		Then I should see "Clients"
		When I fill in "keywords" with "sampleClient-LNX"
		And I click on "Search"
		And I click on "edit"
		And I click on "Lennox"
		And I check "clients[options][lennox_opted_in]"
		And I click on "Save"	
		Then the "clients[options][lennox_opted_in]" checkbox should be checked		
		Then I save a screenshot
		And I wait for 5 seconds
	@clientPublicPage
    Scenario: Client direct public page all reviews
		Given I am on "/sampleClient-LNX"
		Then I should see All Reviews on public pages		
		Then I save a screenshot
	@clientWidgetPage
    Scenario: Client web widget public page all reviews			
		Given I am on "/web-widget/sampleClient-LNX"
		Then I should see All Reviews on public pages
		Then I save a screenshot
	@clientBuzzPage
    Scenario: Client buzz public page all reviews		
		Given I am on "/buzz/sampleClient-LNX"
		Then I should not see text matching "No Reviews Posted"
		Then I save a screenshot
	@clientReviewCounts
    Scenario: Total Review Count for All reviews
		Given I am on "/web-widget/sampleClient-LNX"
		Then I should have total reviews
		Then I save a screenshot

	@ClientManagerLNX	
    Scenario: Lennox Skin is displayed for Client Manager when enabled
        And I am on "/"
    	And I click on login "Client Login"
		When I am authenticated as "sampleManagerLNX@stage.com"
		Then I should not see "Enter Username or Email and valid password"
		When I see welcome message I will close it
		Then I should be on "/clients/home/kpi_dashboard"
		Then I should see "Lennox" skin
		Then I save a screenshot

	@CSRLNX	
    Scenario: Lennox Skin is displayed for CSR when enabled
        And I am on "/"
    	And I click on login "Client Login"
		When I am authenticated as "sampleCSRLNX@stage.com"
		Then I should not see "Enter Username or Email and valid password"
		When I see welcome message I will close it
		Then I should be on "/clients/feedback_requests/"
		Then I should see "Lennox" skin
		Then I save a screenshot	

	@TechLNX	
    Scenario: Lennox Skin is displayed for Technician when enabled
        And I am on "/"
    	And I click on login "Client Login"
		When I am authenticated as "sampleTechLNX@stage.com"
		Then I should not see "Enter Username or Email and valid password"
		When I see welcome message I will close it
		Then I should be on "/employees/?tab=recent"
		Then I should see "Lennox" skin
		Then I save a screenshot

	@LNXPreviewTemplate
    Scenario: Lennox Skin is displayed in Review requests when enabled
        And I am on "/"
    	And I click on login "Client Login"    
		When I am authenticated as "sampleManagerLNX@stage.com"
		When I hover on "Manage"
		And I click on "Review Requests"
		Then I should be on "/clients/review_requests"
		Then I should see text matching "Request Reviews"
		When I click on "Preview"
		Then I should see "Lennox" skin
		Then I save a screenshot

	@RBPreviewTemplate
    Scenario: Lennox Skin is NOT displayed in Review requests when disabled
        And I am on "/"
    	And I click on login "Client Login"
		When I am authenticated as "adminUser"
		Then I should not see "Enter Username or Email and valid password"
		Then I should be on "/admin"
		Then I should see "Clients"
		When I fill in "keywords" with "sampleClient-LNX"
		And I click on "Search"
		And I click on "edit"
		And I click on "Lennox"
		And I uncheck "lennox_white_labeling"
		And I click on "Save"	
		Then the "lennox_white_labeling" checkbox should not be checked		
		Then I save a screenshot
		Then I click on "Logout"
		And I wait for 5 seconds    
        Given I am on "/"
    	And I click on login "Client Login"    
		When I am authenticated as "sampleManagerLNX@stage.com"
		When I see welcome message I will close it
		When I hover on "Manage"
		And I click on "Review Requests"
		Then I should be on "/clients/review_requests"
		Then I should see text matching "Request Reviews"
		When I click on "Preview"
		Then I should not see "Lennox" skin
		Then I save a screenshot

	@DisplayTitleOnDealerIsEnabled
	Scenario: Display Titles on Dealer Locator Page is displayed if enabled
        And I am on "/"
    	And I click on login "Client Login"
		When I am authenticated as "adminUser"
		Then I should not see "Enter Username or Email and valid password"
		Then I should be on "/admin"
		Then I should see "Clients"
		When I fill in "keywords" with "sampleClient-LNX"
		And I click on "Search"
		And I click on "edit"	
		And I click on "Lennox"
		And I check "display_title_lennox_dealer_page"
		And I click on "Save"	
		Then the "display_title_lennox_dealer_page" checkbox should be checked	
		Then I click on "Logout"					
        Given I am on "https://widget-stage.reviewbuzz.com/widgets/test/expanded-legacy?external_system_id=5432112345"
        And I wait for 10 seconds
        And I scroll 400 down
    	Then I should see Review title on review
		Then I save a screenshot

	@DisplayTitleOnDealerIsDisabled
	Scenario: Display Titles on Dealer Locator Page is NOT displayed if disabled
        And I am on "/"
    	And I click on login "Client Login"
		When I am authenticated as "adminUser"
		Then I should not see "Enter Username or Email and valid password"
		Then I should be on "/admin"
		Then I should see "Clients"
		When I fill in "keywords" with "sampleClient-LNX"
		And I click on "Search"
		And I click on "edit"	
		And I click on "Lennox"
		And I uncheck "display_title_lennox_dealer_page"
		And I click on "Save"	
		Then the "display_title_lennox_dealer_page" checkbox should not be checked	
		Then I click on "Logout"					
        Given I am on "https://widget-stage.reviewbuzz.com/widgets/test/expanded-legacy?external_system_id=5432112345"
        And I wait for 10 seconds
        And I scroll 400 down
    	Then I should NOT see Review title on review
		Then I save a screenshot

	@ReplyToBuzzboxIsEnabled
	Scenario: Reply to Buzzbox is Enabled
        And I am on "/"
    	And I click on login "Client Login"
		When I am authenticated as "adminUser"
		Then I should not see "Enter Username or Email and valid password"
		Then I should be on "/admin"
		Then I should see "Clients"
		When I fill in "keywords" with "sampleClient-LNX"
		And I click on "Search"
		And I click on "edit"
		And I check "buzzbox_reply"
		And I click on "Save"	
		Then the "buzzbox_reply" checkbox should be checked	
		Then I click on "Logout"					
        Given I am on "https://widget-stage.reviewbuzz.com/widgets/test/expanded-legacy?external_system_id=5432112345"
        And I wait for 10 seconds
        And I scroll 400 down
    	Then I should see Replied on reviews
		Then I save a screenshot

	@ReplyToBuzzboxIsDisabled
	Scenario: Reply to Buzzbox is Disabled
        And I am on "/"
    	And I click on login "Client Login"
		When I am authenticated as "adminUser"
		Then I should not see "Enter Username or Email and valid password"
		Then I should be on "/admin"
		Then I should see "Clients"
		When I fill in "keywords" with "sampleClient-LNX"
		And I click on "Search"
		And I click on "edit"
		And I uncheck "buzzbox_reply"
		And I click on "Save"	
		Then the "buzzbox_reply" checkbox should not be checked	
		Then I click on "Logout"					
        Given I am on "https://widget-stage.reviewbuzz.com/widgets/test/expanded-legacy?external_system_id=5432112345"
        And I wait for 10 seconds
        And I scroll 400 down
    	Then I should NOT see Replied on reviews
		Then I save a screenshot

	@EditReply
	Scenario: I can EDIT a reply of buzzbox
        And I am on "/"
    	And I click on login "Client Login"
		When I am authenticated as "adminUser"
		Then I should not see "Enter Username or Email and valid password"
		Then I should be on "/admin"
		Then I should see "Clients"
		When I fill in "keywords" with "sampleClient-LNX"
		And I click on "Search"
		And I click on "edit"
		And I check "buzzbox_reply"
		And I click on "Save"	
		Then the "buzzbox_reply" checkbox should be checked	
		Then I click on "Logout"	
        Given I am on "/"
    	And I click on login "Client Login"
		When I am authenticated as "sampleManagerLNX@stage.com"
		When I see welcome message I will close it		
		And I hover on "Feedback"
		And I click on "View Reviews"				
		And I replied "buzzbox reply" on any buzzbox review
		And I wait for 5 seconds
		Then I should see text matching "buzzbox reply"
		When I click "EDIT" on replied review "buzzbox reply" and add " edited reply"
		And I wait for 5 seconds
		Then I should see text matching "buzzbox reply edited reply"
		Then I save a screenshot

	@HideReply
	Scenario: I can HIDE a reply of buzzbox
        Given I am on "/"
    	And I click on login "Client Login"
		When I am authenticated as "sampleManagerLNX@stage.com"
		When I see welcome message I will close it
		And I hover on "Feedback"
		And I click on "View Reviews"	
		When I click "HIDE" replied review "buzzbox reply edited reply"
		And I am on "https://widget-stage.reviewbuzz.com/widgets/test/expanded-legacy?external_system_id=5432112345"
		And I wait for 10 seconds
		And I scroll 400 down
		Then I should not see text matching "buzzbox reply edited reply"
		Then I save a screenshot

	@ShowReply
	Scenario: I can SHOW again the reply of buzzbox
        Given I am on "clients/reviews?rs=reviews"
		When I click "SHOW" replied review "buzzbox reply edited reply"
		And I am on "https://widget-stage.reviewbuzz.com/widgets/test/expanded-legacy?external_system_id=5432112345"
		And I wait for 10 seconds
		And I scroll 400 down
		Then I should see text matching "buzzbox reply edited reply"
		Then I save a screenshot