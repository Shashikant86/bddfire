@main_landmark
Feature: Main Landmark feature


Scenario: Check aria role 'main' in the page
   Given I am on the page
   Then there should be one instance of role=main as an attribute of an HTML element
