Then(/^there should be one instance of role=main as an attribute of an HTML element$/) do
 @page = Capybara.current_session
 @page.html.should include('role="main"')
 step 'the page should be accessible checking: area-alt'
 step 'the page should be accessible checking: aria-allowed-attr'
 step 'the page should be accessible checking: aria-required-attr'
 step 'the page should be accessible checking: aria-required-children'
 step 'the page should be accessible checking: aria-required-parent'
 step 'the page should be accessible checking: aria-valid-attr-value'
 step 'the page should be accessible checking: aria-roles'
 step 'the page should be accessible checking: aria-valid-attr-value'
 step 'the page should be accessible checking: aria-valid-attr'
 step 'the page should be accessible checking: aria-roles'

end
