
Given(/^I am on "(.*?)"$/) do |url|
  visit(url)
end

When(/^I fill in "([^"]*)" with the text "([^"]*)"$/) do |element, text|
  fill_in element, with: text
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end

When(/^I fill "([^"]*)" into field with (.+) "(.*?)"$/) do |data, _type, locator|
  fill_in locator, with: data
end

When(/^I select the "([^"]*)" link$/) do |link|
  click_link(link)
end

When(/^I select the "([^"]*)" button$/) do |button|
  click_button(button)
end

When(/^I click on link having text "([^"]*)"$/) do |text|
  click_link(text)
end

When(/^I check checkbox "([^"]*)"$/) do |box|
  check(box)
end

When(/^I uncheck checkbox "([^"]*)"$/) do |box|
  uncheck(box)
end

When(/^I choose radio button "([^"]*)"$/) do |radiobutton|
  choose(radiobutton)
end

When(/^I select option "([^"]*)" from the dropdown "([^"]*)"$/) do |option, dropdown|
  select(option, from: dropdown)
end

When(/^I attach the file "([^"]*)" to the field "([^"]*)"$/) do |file, locator|
  attach_file(locator, file)
end

When(/^I hover over the element "([^"]*)"$/) do |element|
  page.find(element).hover
end
