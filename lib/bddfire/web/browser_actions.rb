
Given(/^I am on the page "(.*?)"$/) do |url|
  visit(url)
end

When(/^I go forward using browser$/) do
  go_forward
end

When(/^I go back using browser$/) do
  go_back
end

When(/^browser is refreshed$/) do
  page.driver.browser.refresh
end

When(/^I have switched to another window "(.*?)"$/) do |handle|
  switch_to_window(handle)
end

When(/^browser window is resized to width "(.*?)" and height "(.*?)"$/) do |width, height|
  resize_to(width, height)
end

When(/^browser window is maximized$/) do
  maximize_window
end

When(/^I closed browser window$/) do
  close_window
end
