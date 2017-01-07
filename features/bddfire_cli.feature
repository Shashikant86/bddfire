Feature: Install bddfire


  Scenario: Print version
    Given I successfully run `bddfire version`
    Then output should be
    """
    2.0.6
    """

  Scenario: Using rubygems
    Given I successfully run `bddfire`
    Then the output should contain:
    """
    Usage: bddfire <command-name> [parameters] [options]
    """
