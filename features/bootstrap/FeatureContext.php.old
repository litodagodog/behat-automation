<?php

use Behat\Behat\Tester\Exception\PendingException;
use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\MinkExtension\Context\MinkContext;
use Behat\Mink\Driver\Selenium2Driver;
use Behat\Behat\Hook\Scope\AfterStepScope;

class FeatureContext extends MinkContext implements Context, SnippetAcceptingContext
{
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
	  public function iSetBrowserWindowSizeToX($width, $height) {
		$this->getSession()->resizeWindow((int)$width, (int)$height, 'current');
	  }

    /**
     * @Given I click on text :arg1
     */
    public function iClickOnText($text)
    {
        $session = $this->getSession();
		$element = $session->getPage()->find('named', array('link', $text));
        /*$element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', '*//*[text()="'. $text .'"]')
        ); */
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $text));
        }
 
        $element->click();
    }

    /**
     * @When I click on Login :arg1
     */
    public function iClickOnLogin($arg1)
    {
    $page = $this->getSession()->getPage();
    $findName = $page->find("css", "#header>div>div>div.header-line-login>div>a>span");
    if (!$findName) {
        throw new Exception($element . " could not be found");
    } else {
        $findName->click();
    }
 
    }

    /**
     * @When I click the element :arg1
     */
    public function iClickTheElement($element)
    {
    $page = $this->getSession()->getPage();
    $findName = $page->find("css", "#header>div>div>div.header-line-login>div>a>span");
    if (!$findName) {
        throw new Exception($element . " could not be found");
    } else {
        $findName->click();
    }
 
    }
    /**
     * @When I wait for :arg1
     */
    public function iWaitFor($arg1)
    {
        sleep($arg1);
    }

    /**
     * @When I click the loginAdmin :arg1
     */
    public function iClickTheLoginadmin($element)
    {
        $page = $this->getSession()->getPage();
		$findName = $page->find("css", "#login_form>table>tbody>tr:nth-child(4)>td:nth-child(2)>table>tbody>tr>td:nth-child(3)>button>span");
		if (!$findName) {
			throw new Exception($element . " could not be found");
		} else {
			$findName->click();
		}
    }
    /**
     * @When I click on logout :arg1
     */
    public function iClickOnLogout($element)
    {
        $page = $this->getSession()->getPage();
		$findName = $page->find("css", "#admin-topmenu>a:nth-child(2)>li");
		if (!$findName) {
			throw new Exception($element . " could not be found");
		} else {
			$findName->click();
		}
    }

    /**
     * @Then I save a screenshot to :arg1
     */
    /***public function iSaveAScreenshotTo($filename)
    {
		if (!is_dir('screenshots')) {
			mkdir('screenshots', 0777, true);
		}		
        sleep(1);
        $this->saveScreenshot($filename,'screenshots/');
    } */
  /**
   * @AfterStep
   */
	/***  public function takeScreenShotAfterFailedStep(afterStepScope $scope)
	  {
		if (99 === $scope->getTestResult()->getResultCode()) {
		  $driver = $this->getSession()->getDriver();
		  if (!($driver instanceof Selenium2Driver)) {
			return;
		  }
		 $filename = sprintf(
			'%s_%s_%s.%s',
			$this->getMinkParameter('browser_name'),
			date('Ymd') . '-' . date('His'),
			uniqid('', true),
			'png'
		);
		  file_put_contents('screenshots/'.$filename, $this->getSession()->getDriver()->getScreenshot());
		}
	  }  */
        /**
         * @AfterStep
         *
         * @param AfterStepScope $scope
         */
        public function afterStep($scope)
        {
            //if test has failed, and is not an api test, get screenshot
            if(!$scope->getTestResult()->isPassed())
            {
                //create filename string

               $featureFolder = preg_replace('/\W/', '', $scope->getFeature()->getTitle());
                  
                              $scenarioName = $this->currentScenario->getTitle();
                              $fileName = preg_replace('/\W/', '', $scenarioName) . '.png';

                //create screenshots directory if it doesn't exist
                if (!file_exists('report/screenshots_' . $featureFolder)) {
                    mkdir('report/screenshots_' . $featureFolder);
                }

                //take screenshot and save as the previously defined filename
                //$this->driver->takeScreenshot('report/screenshots' . $featureFolder . '/' . $fileName);
                // For Selenium2 Driver you can use:
                file_put_contents('report/screenshots_' . $featureFolder . '/' . $fileName, $this->getSession()->getDriver()->getScreenshot());
            }
        }	  
}
