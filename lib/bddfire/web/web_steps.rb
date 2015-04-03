require 'net/https'
require_relative 'required_files'
require "Capybara/cucumber"
require "rspec"
require 'selenium-webdriver'


Given(/^I am on "(.*?)"$/) do |url|
  visit(url)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |element, text|
  fill_in element, with: text

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end
