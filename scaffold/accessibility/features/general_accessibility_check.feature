@all
Feature: Accessibility Standards


Scenario: Check the page against BBC Accessibility Standards
  Given I am on the page
  Then the page should be accessible
  And the page should be accessible according to: wcag2a
  And the page should be accessible according to: wcag2aa
