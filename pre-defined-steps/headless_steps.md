# Headless Steps

Noe: these steps will only work with Poltergeist driver for Capybara. Don't use it with Selenium


         Then the response status code should be "200"
         Then response headers should contain ""
         Then page source should contain ""
         When I clear network traffic
         When I called network traffic of the page
         Then network traffic should contains resource ""
         When I request response headers
         When I request page "url" with header name "dd" value ""
         When I set the cookie name "cookie" with value ""
         Then I should see the cookie ""
         When I removed cookie "cookie"
         When I clear all cookies
         When I visit page with base authorization user "" and password ""
