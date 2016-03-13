@title
Feature: Page title

Scenario: Check page has title with meaningful text
  Given I am on the page
  Then page should have title html attribute with meaningful text
  And title attribute shouldn't repeat the content
