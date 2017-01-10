Feature: Install bddfire


  Scenario: Using rubygems
  Given I successfully run `bddfire help`
  Then the output should contain:
  """
  Usage: bddfire <command-name> [parameters] [options]
  """
