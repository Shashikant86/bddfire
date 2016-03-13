# Accessibility Steps


         Then page should have title html attribute with meaningful text
         Then there should be one instance of role=main as an attribute of an HTML element
         Then There must be no instances of attributes with positive or zero values
         Then the page should have exactly one h1 heading and heading order must follow


## Axe Steps

You can still use all the steps from Axe Matcher

        Then the page should be accessible
        Then the page should be accessible within "#selector"
        Then the page should be accessible excluding "#selector"
        Then the page should be accessible within "main"; excluding "aside"
        Then the page should be accessible within "main" but excluding "aside"
        Then the page should be accessible according to: tag-name
        Then the page should be accessible within "#header"; according to: best-practice
        Then the page should be accessible according to: wcag2a; checking: color-contrast
        Then the page should be accessible according to: wcag2a and checking: color-contrast
        Then the page should be accessible according to: wcag2a; skipping: accesskeys
        Then the page should be accessible according to: wcag2a but skipping: accesskeys
