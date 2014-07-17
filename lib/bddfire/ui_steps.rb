require_relative 'required_files'

Given(/^I am on the "(.*?)"$/) do |url|
  session = Capybara::Session.new(:poltergeist)
  session.visit(url)
end

Then(/^I should see the text "(.*?)"$/) do |text|
  session = Capybara::Session.new(:poltergeist)
  session.should have_content(text)
end
