Feature: Google Search to explore BDDfire


Scenario: View home page
  Given I am on "http://www.google.com"
  When I fill in "q" with the text "bddfire"
  Then I should see "Sign in"
