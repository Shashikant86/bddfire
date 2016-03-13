require 'axe/cucumber/step_definitions'

Then(/^page should not check section "([^"]*)" for the accessibility guideline$/) do |_section|
  step 'the page should be accessible excluding "#{section}"'
end

Then(/^page should check section"([^"]*)" for the accessibility guideline$/) do |_section|
  step 'the page should be accessible excluding "#{section}"'
end

Then(/^the page should have exactly one h(\d+) heading and heading order must follow$/) do |_headings|
  page.html.should include('<h1')
  page.should have_css('h1', count: 1)
  step 'the page should be accessible checking: heading-order'
  step 'the page should be accessible checking: empty-heading'
end

Then(/^there should be one instance of role=main as an attribute of an HTML element$/) do
  page.html.should include('role="main"')
  step 'the page should be accessible checking: area-alt'
  step 'the page should be accessible checking: aria-allowed-attr'
  step 'the page should be accessible checking: aria-required-attr'
  step 'the page should be accessible checking: aria-required-children'
  step 'the page should be accessible checking: aria-required-parent'
  step 'the page should be accessible checking: aria-valid-attr-value'
  step 'the page should be accessible checking: aria-roles'
  step 'the page should be accessible checking: aria-valid-attr-value'
  step 'the page should be accessible checking: aria-valid-attr'
  step 'the page should be accessible checking: aria-roles'
end

Then(/^page should have title html attribute with meaningful text$/) do
  title = page.title
  puts "======You page title is '#{title}'. We hope it's meaningful===="
  title.should_not be_empty
end

Then(/^There must be no instances of attributes with positive or zero values$/) do
  step 'the page should be accessible checking: tabindex'
end
