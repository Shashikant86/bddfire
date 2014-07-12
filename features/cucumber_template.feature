Feature: Generate cucumber template
  
  Scenario: Generate Cucumber
    
    Given I have empty directory
    When I run BDDfire
    Then I shouls see all the files and directories are created
