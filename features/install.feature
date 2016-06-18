Feature: Install bddfire 


  Scenario: Using rubygems
    Given I successfully run `gem install bddfire`
    Then bddfire should be installed on the local system

    