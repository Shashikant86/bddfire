@focus
Feature: Focusable Controls

Scenario Outline: Identify each control on the page
  Given I am on the page
  Then page should have all relevant  "<attributes>" for the accessibility guideline
Examples:
    | attributes            |
    | blink                 |
