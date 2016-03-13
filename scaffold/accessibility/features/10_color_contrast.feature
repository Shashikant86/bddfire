@color_contrast
Feature: Color Contrast

Scenario Outline: Page should have valid color combinations according to BBC accessibility standards
  Given I am on the page
  Then page should have all relevant  "<attributes>" for the accessibility guideline
Examples:
    | attributes     |
    | accesskeys     |
    | color-contrast |
