@forms
Feature: Form on the page

Scenario Outline: Make sure all the form elements are accessible
  Given I am on the page
  Then page should have all relevant  "<attributes>" for the accessibility guideline

Examples:
    | attributes       |
    | label-title-only |
  
