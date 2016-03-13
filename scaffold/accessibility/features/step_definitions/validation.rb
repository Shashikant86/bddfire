Then(/^the page should have valid Markup, CSS, JavaScript and feeds$/) do
  @page = Capybara.current_session
  @page.should be_valid_markup
end
