@tables
Feature: Table Accessibility

Scenario Outline: Tables in the page are accessibile
  Given I am on the page
  Then page should have all relevant  "<attributes>" for the accessibility guideline

Examples:
    | attributes   |
    | data-table   |
