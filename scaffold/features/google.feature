Feature: Google Search to explore BDDfire


Scenario: View home page
  Given I am on "http://www.google.com"
  When I fill "q" with the text "shashi"
  Then I should see "Sign in"
