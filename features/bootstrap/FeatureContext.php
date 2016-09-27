<?php

use Behat\Behat\Tester\Exception\PendingException;
use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

/**
 * Defines application features from the specific context.
 */
class FeatureContext implements Context, SnippetAcceptingContext
{
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
        $this->_magentoRoot = realpath(__DIR__ . '/../../magento');
    }

    /**
     * @Given I have a module called :moduleCode installed
     */
    public function iHaveAModuleCalledInstalled($moduleCode)
    {
        $this->_moduleCode = $moduleCode;
        $initFile = $moduleCode . '.xml';
        $initFilePath = $this->_magentoRoot . '/app/etc/modules/' . $initFile;

        if (!file_exists($initFilePath)) {
            throw new Exception("Module init file " . $initFilePath . ' not found');
        }
    }

    /**
     * @When I view all available modules
     */
    public function iViewAllAvailableModules()
    {
        $jsonResponse = shell_exec("n98-magerun.phar dev:module:list --root-dir=magento/ --format=json");
        $this->_allModules = json_decode($jsonResponse, true);
    }

    /**
     * @Then :moduleCode should be visible
     */
    public function shouldBeVisible($moduleCode)
    {
        $index = array_search($moduleCode, array_column($this->_allModules, 'Name'));

        if($index === false) {
            throw new Exception($moduleCode . " not found in modules list");
        }

        $this->_foundModule = $this->_allModules[$index];
    }

    /**
     * @Then :moduleCode will have an :state state
     */
    public function willHaveAnState($moduleCode, $state)
    {
        if($this->_foundModule['Status'] !== $state) {
            throw new Exception($moduleCode . " should be " . $state . ' not ' . $this->_foundModule['Status']);
        }
    }
}
