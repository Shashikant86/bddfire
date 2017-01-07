Feature: Install bddfire


  Scenario: Using rubygems
    Given I successfully run `gem list | bddfire`
    Then the output should contain:
    """
    bddfire
    """
