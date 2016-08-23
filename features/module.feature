Feature: module
    In order to continue module development
    As a developer
    My module should be installed and active in Magento

Scenario: Module is available from config
    Given I have a module called "Mage_Bundle" installed
    When I view all available modules
    Then "Mage_Bundle" should be visible
    And "Mage_Bundle" will have an "active" state
