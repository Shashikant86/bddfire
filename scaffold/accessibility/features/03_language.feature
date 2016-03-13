@language
Feature: Specify content language

Scenario Outline: Check for other elements with lang attributes
    Given I am on the page
    Then page should have all relevant  "<attributes>" for the accessibility guideline
Examples:
  |attributes|
  |html-lang |
