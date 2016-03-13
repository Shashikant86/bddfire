@tabindex
Feature: Check tabindex

Scenario: Check Tabindex rule
  Given I am on the page
  Then There must be no instances of attributes with positive or zero values
