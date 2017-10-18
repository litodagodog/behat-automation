<?php

use Behat\Behat\Tester\Exception\PendingException;
use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\MinkExtension\Context\MinkContext;
use Behat\MinkExtension\Context\RawMinkContext;
use Behat\Mink\Driver\Selenium2Driver;
use Behat\Gherkin\Node\TableNode;
use Behat\Gherkin\Node\StepNode;
use Behat\Gherkin\Node\ScenarioNode;
use Behat\Behat\Hook\Scope\AfterStepScope;
use Behat\Behat\Event\StepEvent;


class FeatureContext extends MinkContext implements Context, SnippetAcceptingContext
{

	private $users = array();

	/**
	* @Given /^there are following users:$/
	*/
	public function thereAreFollowingUsers(TableNode $table) {
		foreach ($table->getHash() as $row) 
        {
			$this->users[$row['username']] = $row;
		}
	}	

    /**
     * @BeforeScenario
     *
     * @param BeforeScenarioScope $scope
     *
     */
    public function setUpTestEnvironment($scope)
    {
        $this->currentScenario = $scope->getScenario();

    }    
	
	/**
	   * @Given /^I set browser window size to "([^"]*)" x "([^"]*)"$/
	   */
	public function iSetBrowserWindowSizeToX($width, $height) 
    {
        $this->getSession()->resizeWindow((int)$width, (int)$height, 'current');
    }

    /**
     * @Given I click on text :arg1
     */
    public function iClickOnText($arg1)
    {
        $session = $this->getSession();
		$element = $session->getPage()->find('named', array('link', $arg1));
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
        }
 
        $element->click();
    }

    /**
     * @When I click on Login :arg1
     */
    public function iClickOnLogin($arg1)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find("css", "#header>div>div>div.header-line-login>div>a>span");
        if (!$element) 
        {
            throw new Exception($arg1 . " could not be found");
        } else 
        {
            $element->click();
        }

        sleep(3);
 
    }

    /**
     * @When I click the loginAdmin :arg1
     */
    public function iClickTheLoginadmin($arg1)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find("css", "#login_form>table>tbody>tr:nth-child(4)>td:nth-child(2)>table>tbody>tr>td:nth-child(3)>button>span");
		if (!$element)
        {
			throw new Exception($arg1 . " could not be found");
		}
        else
        {
			$element->click();
		}
    }

    /**
     * @When I click on logout :arg1
     */
    public function iClickOnLogout($arg1)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find("css", "#admin-topmenu>a:nth-child(2)>li");
		if (!$element)
        {
			throw new Exception($arg1 . " could not be found");
		} 
        else 
        {
			$element->click();
		}
    }

    /**
     * @When I press on :arg1 button
     */
    public function iPressOnButton($arg1)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find("css", "#add_client");
		if (!$element)
        {
			throw new Exception($arg1 . " could not be found");
		} 
        else 
        {
			$element->click();
		}
    }	  


    /**
     * @When I am authenticated as :arg1
     */
    public function iAmAuthenticatedAs($username)
    {
		if (!isset($this->users[$username]['password'])) 
        {
			throw new \OutOfBoundsException('Invalid user '. $username);
		}
		$this->fillField('username', $username);
		$this->fillField('password', $this->users[$username]['password']);
		$this->pressButton('Log In');	
		sleep(3);
    }

    /**
     * @AfterStep
     */
    public function takeScreenshotAfterFailedStep($event)
    {
      if ($event->getTestResult()->getResultCode() === \Behat\Testwork\Tester\Result\TestResult::FAILED) {
        $driver = $this->getSession()->getDriver();
        if ($driver instanceof \Behat\Mink\Driver\Selenium2Driver) {
               $scenarioName = $this->currentScenario->getTitle();
               $step = $event->getStep();
               $stepText = $scenarioName . '_' . $step->getText();
               //$stepText = $event->getStep()->getText();
               $fileName = 'Fail.'.preg_replace('#[^a-zA-Z0-9\._-]#', '',$stepText).'.png';
               $filePath = 'report/failed_screenshots';
               if(!is_dir($filePath)){
                  mkdir($filePath, 0777, true);
                }               
               $this->saveScreenshot($fileName, $filePath);
               //print "Screenshot for '{$stepText}' placed in ".$filePath.DIRECTORY_SEPARATOR.$fileName."\n";
          }
      }
    }   

    /**
     * @Then I save a screenshot
     */
    public function iSaveAScreenshot()
    {        
        if (!is_dir('report/success_screenshots/')) 
        {
            mkdir('report/success_screenshots/', 0777, true);
        }       
        sleep(1);
        $scenarioName = $this->currentScenario->getTitle();
        $this->saveScreenshot($scenarioName.'.png','report/success_screenshots/');
    }     

    /**
     * @When I wait for :arg1 seconds
     */
    public function iWaitForSeconds($arg1)
    {
        sleep($arg1);
    }

    /**
     * @Then I accept the term of use
     */
    public function iAcceptTheTermOfUse()
    {
        $session = $this->getSession();
        $element = $session->getPage()->find("css", '#agree_button');
		if ($element) 
        {
			$element->click();
		} else 
        {
		}
    }

    /**
     * @Then I should see the newly created client :arg1
     */
    public function iShouldSeeTheNewlyCreatedClient($arg1)
    {
		$td = $this->getSession()->getPage()->find('css',
			sprintf('table tbody tr td:contains("%s")', $arg1));
    }

    /**
     * @When I click on :arg1
     */
    public function iClickOn($arg1)
    {
		sleep(3);
        $session = $this->getSession();
        switch($arg1){
            case 'Reply':
                $element = $session->getPage()->find("css", '.reply-button');
                if ($element) 
                {
                    $element->click();  
                }
                break;
            case 'Continue':
                $element = $session->getPage()->find('named', array('id', 'submit'));
                if (null === $element) 
                {
                    throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
                }
         
                $element->click();
                break;
            case 'Send': 
                $element = $session->getPage()->find('named', array('id', 'send-review-request'));
                if (null === $element) 
                {
                    throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
                }
         
                $element->click();
                break;
            case 'And New member':
                $element = $session->getPage()->find("css", "#client_manager_db_settings_team_members_instance_1_member");
                if (null === $element) 
                {
                    throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
                }

                $element->click();
                break;
            case 'Field/Service':
                $element = $session->getPage()->find("css", "#frm_add_edit_user>div:nth-child(6)>div>table>tbody>tr:nth-child(2)>td:nth-child(1)>input[type='radio']");
                if (null === $element) 
                {
                    throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
                }

                $element->click();
                break;
            case 'Employee Access':
                $element = $session->getPage()->find("css", "#is_csr");
                
                if (null === $element) 
                {
                    throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
                }

                $element->click(); 
                break; 
            case 'Preview':
                $element = $session->getPage()->find("css", "#send-review-preview");
                if (null === $element) 
                {
                    throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
                }

                $element->click(); 
                break;                             
            default:
                $element = $session->getPage()->find('named', array('link', $arg1));
                if (null === $element) 
                {
                    throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
                }
         
                $element->click();                                            
        }  
    }

    /**
     * @Then I should see the newly created user :arg1
     */
    public function iShouldSeeTheNewlyCreatedUser($arg1)
    {
		$td = $this->getSession()->getPage()->find('css',
			sprintf('table tbody tr td:contains("%s")', $arg1));
    }

    /**
     * @Given I click on employee :arg1
     */
    public function iClickOnEmployee($arg1)
    {
		sleep(3);
		$session = $this->getSession();
		try
		{
			$element = $session->getPage()->find('named', array('content', $arg1));
			$element->click();
		/*if (null === $element) {
			throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
		} */
		}
		catch(\WebDriver\Exception\ElementNotVisible $f)
		{
			$checkElem = $session->getPage()->find("css", '#peoples>div.next_arrow1>a>img');		
			if ($checkElem)
			{
				$checkElem->click();
				sleep(3);
				$elementNext = $session->getPage()->find('named', array('content', $arg1));
				//$elementNext = $session()->getPage()->find('xpath', '//label[text()=' . $arg1 . ']');
				//$elementNext = $session->getPage()->findLink($arg1);
				if($elementNext)
				{
					$elementNext->click();
				}
				else{
					echo "element not found!";
				}
			}
		}
		/***if(null === $element)
		{
			$checkElem = $session->getPage()->find("css", '#peoples>div.next_arrow1>a>img');		
			if ($checkElem)
			{
				$checkElem->click();
				sleep(3);
				$elementNext = $session->getPage()->find('named', array('content', $arg1));
				//$elementNext = $session()->getPage()->find('xpath', '//label[text()=' . $arg1 . ']');
				//$elementNext = $session->getPage()->findLink($arg1);
				var_dump($elementNext);
				if($elementNext)
				{
					$elementNext->click();
				}
				else{
					echo "element not found!";
				}
			}			

		}
		else
		{
			$element->click();
		} **/
			
    }

    /**
     * @Then I add :arg1 star review
     */
    public function iAddStarReview($arg1)
    {
		sleep(3);
        $session = $this->getSession();
        $element = $session->getPage()->find("css", '#rating_stars_new>div:nth-child(' . $arg1 . ')');
		if ($element) 
        {
			$element->click();
		} 
        else 
        {
		}
    }

    /**
     * @When I hover on :arg1
     */
    public function iHoverOn($arg1)
    {
		sleep(2);
		$session = $this->getSession();
		if ($arg1 === 'Feedback')
		{
			$element = $session->getPage()->find('named', array('id', 'reviews'));
			if (null === $element) 
            {
				throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
			}	 

			$element->mouseOver();
		}
		elseif ($arg1 === 'Manage')
		{
			$element = $session->getPage()->find('named', array('id', 'manage'));
			if (null === $element) 
            {
				throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
			}

			$element->mouseOver();			
		}
        elseif ($arg1 === 'Settings')
        {
            $element = $session->getPage()->find('named', array('id', 'account'));
            if (null === $element) 
            {
                throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
            }

            $element->mouseOver();          
        }        
		else
		{
            $session = $this->getSession();
            $element = $session->getPage()->find('named', array('content', $arg1));
            if (null === $element) 
            {
                throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
            }
     
            $element->mouseOver();
		}		
    }


    /**
     * @Then I select date :arg1
     */
    public function iSelectDate($arg1)
    {
        sleep(2);
        $td = $this->getSession()->getPage()->find('css',
            sprintf('table tbody tr td[title="%s"]', $arg1));
        $td->click();
    }

    /**
     * @Then I should see :arg1 button
     */
    public function iShouldSeeButton($arg1)
    {
        sleep(2);
        $session = $this->getSession();
        $session->executeScript('window.scrollTo(0,500);');
        switch($arg1)
        {
            case 'Send Meet the team Email':
                $element = $session->getPage()->find("css", "#request_buttons>li");
                if (!$element) 
                {
                    throw new Exception($arg1 . " could not be found");
                }  
                break;  
            case 'Send Review Request':
                $element = $session->getPage()->find("css", "#request_buttons > li.email_available > a");
                if (!$element) 
                {
                    throw new Exception($arg1 . " could not be found");
                }  
                break;                              
        }

    }

    /**
     * @When I replied :arg1 on review
     */
    public function iRepliedOnReview($arg1)
    {
        sleep(2);
        $session = $this->getSession();
        $element = $session->getPage()->find("css", ".reply-text-textarea");
        if ($element) 
        {
            $element->setValue($arg1);
        }
   
    }

    /**
     * @When I click Alert Confirmation
     */
    public function iClickAlertConfirmation()
    {
        $this->getSession()->getDriver()->getWebDriverSession()->accept_alert();
    }

    /**
     * @When I deactivate the user :arg1
     */
    public function iDeactivateTheUser($arg1)
    {
   
        sleep(2);
        $session = $this->getSession();
        $elementsAll = $session->getPage()->findAll('css','#wizard_employees_table>tbody');        
        foreach($elementsAll as $element)
        {
            //echo $element->getText();
            //$element->getAttribute('title')
            $subArg1 = substr($arg1, 0, 11);
            $checkUser = preg_match('/'. $subArg1 .'/', $element->getText());
            if($checkUser)
            {
                $deactivateUser = $session->getPage()->find('css',
                    sprintf('td.member_name:contains("%s")  ul  li:nth-child(2)  a',$subArg1));
                if($deactivateUser->getText() !== 'deactivate')
                {
                    throw new \InvalidArgumentException(sprintf('"%s" : user is already deactivated!', $arg1));
                }
                $deactivateUser->click(); 
                $session->getDriver()->getWebDriverSession()->accept_alert();
                sleep(2);
                $session->getDriver()->getWebDriverSession()->accept_alert();
                break;
            }
            else
            {
                throw new \InvalidArgumentException(sprintf('"%s" : user not found!', $arg1));  
                break;     
            }

        } 
    }

    /**
     * @Then I click on element :arg1
     */
    public function iClickOnElement($arg1)
    {
        sleep(2);
        $session = $this->getSession();
        $element = $session->getPage()->find("css", "#tech_form>div:nth-child(4)>button>span");
        if (null === $element) 
        {
            throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $arg1));
        }
 
        $element->click();
    }


    /**
     * @Then bragbook for :arg1 is saved
     */
    public function bragbookForIsSaved($arg1)
    {
        sleep(10);
        $exists = false;
        foreach(scandir('C:/Users/LANEX-LITO/Downloads') as $file) 
        {
            if(preg_match('/BragBook_' . $arg1 . '\.$/', $file)) 
            {
                $exists = true;
                break;
            }
        }
    }

    /**
     * @Then Excel file is successfully saved
     */
    public function excelFileIsSuccessfullySaved()
    {
        sleep(10);
        clearstatcache();
        if (file_exists("C:/Users/LANEX-LITO/Downloads/reviews.xls")) 
        {
            print "reviews.xls exists!";
        } else 
        {
            print "reviews.xls does not exist!";
        }
    }

    /**
     * @When I delete :arg1 review from list
     */
    public function iDeleteReviewFromList($arg1)
    {
        $session = $this->getSession();
        #service_areas_table > tbody    --> loop through all tbody of review list
        #td:nth-child(3) > div --> only get the first review in list
        $elementsAll = $session->getPage()->findAll('css',
            sprintf('#service_areas_table > tbody'));
        $ray_state = array_filter($elementsAll);
        if (empty($ray_state))
        {
            throw new \InvalidArgumentException(sprintf('Review list is empty!'));  
        }
        else
        {
            foreach($elementsAll as $element)
            {
                //echo $element->getText();
                if(preg_match('/'. $arg1 .'/', $element->getText()))
                {
                    $deleteLink = $session->getPage()->find('css',
                        sprintf('td:nth-child(3) > div:contains("%s") > ul > li', $arg1));
                    $deleteLink->click();
                    $session->getDriver()->getWebDriverSession()->accept_alert();
                    break;
                }
                else
                {
                    throw new \InvalidArgumentException(sprintf('"%s" : Review not found!', $arg1));
                    break;
                }

            }            
        }
       
    }

    /**
     * @When I pick :arg1 as featured review
     */
    public function iPickAsFeaturedReview($arg1)
    {       
        $session = $this->getSession();
        $CheckReviewToFeatured = $session->getPage()->find('css',
        sprintf('td.center.featured_review_column>input[type="checkbox"]>td.center>div:contains("%s")', $arg1));  
        $CheckReviewToFeatured->click();
        /***$ray_state = array_filter($CheckReviewToFeatured);
        if (empty($ray_state))
        {
            throw new \InvalidArgumentException(sprintf('Review list is empty!'));  
        }
        else
        {
            foreach($CheckReviewToFeatured as $toCheck)  
            {
                $subArg1 = substr($toCheck->getAttribute('type'), 0, 6);
                if($subArg1 === 'checkbox')
                {
                    echo $subArg1;
                    $ReviewToFeatured = $session->getPage()->find('css',
                        sprintf('td:nth-child(3) > div:contains("%s")', $arg1));
                    if(preg_match('/'. $arg1 .'/', $ReviewToFeatured->getText()))
                    {
                        $toCheck->click();
                    }
                }

            }      
        }   
        /***$elementsAll = $session->getPage()->findAll('css',
            sprintf('#service_areas_table > tbody'));
        $ray_state = array_filter($elementsAll);
        if (empty($ray_state))
        {
            throw new \InvalidArgumentException(sprintf('Review list is empty!'));  
        }
        else
        {
            foreach($elementsAll as $element)
            {
                //echo $element->getText();
                if(preg_match('/'. $arg1 .'/', $element->getText()))
                {
                    $ReviewToFeatured = $session->getPage()->find('css',
                        sprintf('td:nth-child(3) > div:contains("%s")', $arg1));
                    if(preg_match('/'. $arg1 .'/', $ReviewToFeatured->getText()))
                    {
                        $ReviewToFeatured->getAttribute('class');
                        $CheckReviewToFeatured = $session->getPage()->findAll('xpath',
                        sprintf('//table/tbody/tr/td/input'));   
                        foreach($CheckReviewToFeatured as $toCheck)  
                        {
                            echo $toCheck->getAttribute('type');
                        }
                        //$CheckReviewToFeatured->click();                   
                    }
                    break;
                }
                else
                {
                    throw new \InvalidArgumentException(sprintf('Cannot select featured review!'));
                    break;
                }

            }            
        }     **/  
        /***$session = $this->getSession();
        $elementsAll = $session->getPage()->findAll('css',
            sprintf('#service_areas_table > tbody'));
        $ray_state = array_filter($elementsAll);
        if (empty($ray_state))
        {
            throw new \InvalidArgumentException(sprintf('Review list is empty!'));  
        }
        else
        {
            foreach($elementsAll as $element)
            {

                echo $element->getText();
                $CheckFeatured = $session->getPage()->find('css',
                    sprintf('#service_areas_table > tbody[type="checkbox"]'));
                if(preg_match('/'. $arg1 .'/', $element->getText()))
                {
                    $radioButton = $page->find('css', '#'.$label->getAttribute('for'));
                    $radioButton->click();
                    $CheckFeatured = $session->getPage()->find('css',
                        sprintf('td.center.featured_review_column>input[type="checkbox"]'));
                    $CheckFeatured->click();
                    break;

                }
                else
                {                  
                    throw new \InvalidArgumentException(sprintf('Cannot select featured review!'));
                    break;
                } 

            }            
        } ***/
    }

    /**
     * @When I undelete :arg1 review from list
     */
    public function iUndeleteReviewFromList($arg1)
    {
        sleep(2);
        $session = $this->getSession();
        $elementsAll = $session->getPage()->findAll('css',
            sprintf('#service_areas_table > tbody'));
        $ray_state = array_filter($elementsAll);
        if (empty($ray_state)) {
            throw new \InvalidArgumentException(sprintf('Delete Review is empty!'));
        }
        else {
            foreach($elementsAll as $element) {
                if(preg_match('/'. $arg1 .'/', $element->getText())) {
                    $CheckLink = $session->getPage()->find('css',
                        sprintf('td:contains("%s") ul > li',$arg1));
                    $CheckLink->click();
                    break;
                }
                else {
                    throw new \InvalidArgumentException(sprintf('"%s" Review not found!', $arg1));
                    break;
                }
            }            
        }
    }

    /**
     * @When I replied :arg1 on any buzzbox review
     */
    public function iRepliedOnAnyBuzzboxReview($arg1)
    {
        $session = $this->getSession();
        /***$elementsAll = $session->getPage()->findAll('css',
            sprintf('#service_areas_table > tbody > tr > td > div:contains("Reply")'));  
        foreach($elementsAll as $element) {
            //if(preg_match('/Reply/', $element->getText())) {
            if(stripos($element->getText(), "Reply") !== false) {                        
                $element->click();
                $session->executeScript('window.scrollTo(0,500);');
                $elementTextArea = $session->getPage()->findAll('css', 'textarea');
                foreach($elementTextArea as $elementCheck) {
                    var_dump($elementCheck->getText());
                    //var_dump($elementCheck->getAttribute('class'));
                    //var_dump($elementCheck->getText());
                    if($elementCheck->getText() !== $arg1){
                        $elementCheck->setValue($arg1);
                        break;
                    }
                    //echo $elementCheck->getText();
                }
                //$elementTextArea->setValue($arg1);
                //$addReplies = $session->evaluateScript("jQuery('textarea').val('$arg1');");
                //$CheckValue = $session->evaluateScript("jQuery('textarea')[0].value;");
                //var_dump($addReply);
                //echo $addReply[0]["ELEMENT"];
                //$session->evaluateScript("jQuery('span.save-button').click();");
                #review_row633737 > td:nth-child(5) > div.reply > div.reply-buttons > span.save-button
                //$postReply = $session->getPage()->find('css', 'td:nth-child(5) > div.reply.active > div.reply-buttons > span.save-button > a');
                //$postReply->click();
                break;                     
            }
        } ***/
        $elements = $session->getPage()->findAll('css',
            sprintf('#service_areas_table > tbody > tr > td > div:contains("Reply")'));  
        //$element->click();
        //$session->executeScript('window.scrollTo(0,500);');
        //$addReply = $session->executeScript("jQuery('textarea').val('$arg1');");
        foreach($elements as $element){
            if(preg_match('/Reply/', $element->getText())) {                
                $element->click();
                $elementTextArea = $session->getPage()->findAll('css', 'textarea');
                foreach($elementTextArea as $textareaCheck){
                    echo $textareaCheck->getText();
                    if($textareaCheck->getText() !== $arg1){
                        //$textareaCheck->setValue($arg1);
                        break;
                    }
                }
                
            }
        }
        //$session->executeScript("jQuery('span.save-button')[0].click();");   
    }
}
