
Then(/^the page title is "(.*?)"$/) do |title|
  page.should have_title(title)
end

Then(/^I see the element "(.*?)" with the text "(.*?)"$/) do |element, text|
  page.should have_css(element, text: text)
end

Then(/^page contains "(.*?)"$/) do |element|
  page.should have_css(element)
end

Then(/^I see element "(.*?)" "(.*?)" times$/) do |element, count|
  page.should have_css(element, count: count)
end

Then(/^page contains the button "(.*?)"$/) do |button|
  page.should have_buttton(button)
end

Then(/^page contains the field "(.*?)"$/) do |field|
  page.should have_field(field)
end

Then(/^page contains the link "(.*?)"$/) do |link|
  page.should have_link(link)
end

Then(/^page contains the table "(.*?)"$/) do |table|
  page.should have_table(table)
end

Then(/^the element "(.*?)" is checked$/) do |element|
  page.should have_checked_field(element)
end

Then(/^the element "(.*?)" is unchecked$/) do |element|
  page.should have_unchecked_field(element)
end

Then(/^the page contains the following content "(.*?)"$/) do |content|
  page.should have_content(content)
end
