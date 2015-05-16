
Then(/^page should have title "(.*?)"$/) do |title|
  page.should have_title(title)
end

Then(/^I should see element "(.*?)" having text "(.*?)"$/) do |element, text|
  page.should have_css(element, :text => text)
end

Then(/^page should have element "(.*?)"$/) do |element|
  page.should have_css(element)
end

Then(/^I should see element "(.*?)" having count "(.*?)"$/) do |element, count|
  page.should have_css(element, :count => count)
end

Then(/^page should have button "(.*?)"$/) do |button|
  page.should have_buttton(button)
end

Then(/^page should have field "(.*?)"$/) do |field|
  page.should have_field(field)
end

Then(/^page should have link "(.*?)"$/) do |link|
  page.should have_link(link)
end

Then(/^page should have table "(.*?)"$/) do |table|
  page.should have_table(table)
end

Then(/^I should see an element "(.*?)" with checked field$/) do |element|
  page.should have_checked_field(element)
end

Then(/^I should see an element "(.*?)" with unchecked field$/) do |element|
  page.should have_unchecked_field(element)
end

Then(/^I should see content "(.*?)" in the page$/) do |content|
  page.should have_content(content)
end
