@images
Feature: Image Accessibility

Scenario Outline: Images in the page should be accessible
  Given I am on the page
  Then page should have all relevant  "<attributes>" for the accessibility guideline

Examples:
    | attributes            |
    | image-alt             |
