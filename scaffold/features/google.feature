Feature: Google Search to explore BDDfire


Scenario: View home page
  Given I am on "www.google.com"
  When I fill in "q" with "shashi"
  Then I should see "Sign in"
