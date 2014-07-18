require 'bddfire'
Given(/^I am on the home page$/) do
 visit "http://www.google.com"
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |element, text|
 fill_in element, with: text
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end