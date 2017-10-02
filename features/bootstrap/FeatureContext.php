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
	   * @Given /^I set browser window size to "([^"]*)" x "([^"]*)"$/
	   */
	  public function iSetBrowserWindowSizeToX($width, $height) {
		$this->getSession()->resizeWindow((int)$width, (int)$height, 'current');
	  }
    /**
     * @Given I click the :arg1
     */
    public function iClickTheElement($selector) // I also tried to use And I click the ".searchButton" but result is the same
    /* {
        $page = $this->getSession()->getPage();
        $element = $page->find('css', $selector);

        if (empty($element)) {
            throw new Exception("No html element found for the selector ('$selector')");
        }

        $element->click();
    }	*/
	    {
        $session = $this->getSession();
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', '*//a[text()="'. $text .'"]')
        );
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $text));
        }
 
        $element->click();
    }
    /**
     * @When /^I click li option "([^"]*)"$/
     *
     * @param $text
     * @throws \InvalidArgumentException
     */
    public function iClickLiOption($text)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', '*//*[text()="'. $text .'"]')
        );

        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $text));
        }

        $element->click();
    }	


    /**
     * @Given I click on text :arg1
     */
    public function iClickOnText($text)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', '*//*[text()="'. $text .'"]')
        );
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $text));
        }
 
        $element->click();
    }
}
