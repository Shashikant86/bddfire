Then(/^the page should have exactly one h(\d+) heading and heading order must follow$/) do |headings|
  @page = Capybara.current_session
  @page.html.should include('<h1')
  @page.should have_css("h1", :count => 1)
  step 'the page should be accessible checking: heading-order'
  step 'the page should be accessible checking: empty-heading'
end
