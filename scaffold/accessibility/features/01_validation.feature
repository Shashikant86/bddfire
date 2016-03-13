@validation
Feature: HTML Validation

Scenario: Validate page with W3C validator for CSS, JavaScript and Feed
    Given I am on the page
    Then the page should have valid Markup, CSS, JavaScript and feeds
