
Given(/^I am on "(.*?)"$/) do |url|
  visit(url)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |element, text|
  fill_in element, with: text
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end

When(/^I fill "(.*?)" into field with (.+) "(.*?)"$/) do |data, type, locator|
  fill_in locator, with: data
end

When(/^I click on element "(.*?)"$/) do |link|
  click_link(link)
end

When(/^I click on button "(.*?)"$/) do |button|
  click_button(button)
end

When(/^I click on link having text "(.*?)"$/) do |text|
  click_link(text)
end

When(/^I checked checkbox "(.*?)"$/) do |box|
  check(box)
end

When(/^I unchecked checkbox "(.*?)"$/) do |box|
  uncheck(box)
end

When(/^I choose radio button"(.*?)"$/) do |radiobutton|
  choose(radiobutton)
end

When(/^I select option "(.*?)" from dropdown "(.*?)"$/) do |option, dropdown|
  select(option, :from => dropdown)
end

When(/^I attached file "(.*?)" to field "(.*?)"$/) do |file, locator|
  attach_file(locator, file)
end

When(/^I hover over element"(.*?)"$/) do |element|
  page.find(element).hover
end
