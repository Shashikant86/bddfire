require 'axe/cucumber/step_definitions'

Given(/^I am on the page$/) do
  @page = Capybara.current_session
  @page.visit(ENV['URL'])
  puts "=====You are currently checking the page====="
  puts @page.current_url
  sleep(1)
end

Then(/^page should have all relevant  "([^"]*)" for the accessibility guideline$/) do |attributes|
  ban = ENV['EXCLUDE'] || "#crapy-selector"
  step 'the page should be accessible checking: #{attributes} but excluding "#{ban}"'
end

Then(/^page should not check section "([^"]*)" for the accessibility guideline$/) do |section|
  step 'the page should be accessible excluding "#{section}"'
end

Then(/^page should check section"([^"]*)" for the accessibility guideline$/) do |section|
  step 'the page should be accessible excluding "#{section}"'
end
