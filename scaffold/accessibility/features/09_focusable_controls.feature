@focus
Feature: Focusable Controls

Scenario Outline: Identify each control on the page
  Given I am on the page
  Then page should have all relevant  "<attributes>" for the accessibility guideline
Examples:
    | attributes            |
    | area-alt              |
    | audio-caption         |
    | blink                 |
    | button-name           |
    | checkboxgroup         |
    | data-table            |
    | definition-list       |
    | dlitem                |
    | duplicate-id          |
    | frame-title           |
    | image-alt             |
    | input-image-alt       |
    | label-title-only      |
    | label                 |
    | layout-table          |
    | link-name             |
    | list                  |
    | listitem              |
    | marquee               |
    | meta-refresh          |
    | meta-viewport         |
    | mobject-alt           |
    | radiogroup            |
    | region                |
    | scope                 |
    | server-side-image-map |
    | skip-link             |
    | video-caption         |
    | video-description     |
