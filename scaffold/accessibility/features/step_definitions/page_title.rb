Then(/^page should have title html attribute with meaningful text$/) do
  @page = Capybara.current_session
  title = @page.title
  puts "======You page title is '#{title}'. We hope it's meaningful===="
  expect(title).not_to be_empty
end
