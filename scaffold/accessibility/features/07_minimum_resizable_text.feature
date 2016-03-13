@resize
Feature: Minimum and Re-sizable text size

Scenario: Text size is readable
  Given I am on the page
  Then Text must be styled with units that are resizable in all browsers.
  And Content must be visible and usable with text resized to 200% of normal.
  And Content must be visible and usable with page zoomed to 200% of normal.
