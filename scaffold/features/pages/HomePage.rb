class HomePage
  class << self
    attr_accessor :title, :title_text
  end

  self.title_text = 'Your Site '
  self.title = 'your_css_selector'

  def initialize(_session)
    @session = Capybara.current_session
  end

  def visit_home_page
    @session.visit('your_url')
  end
end

# You can the use these methods in the step_definitions as
# @home_page = HomePage.new(Capybara.current_session)
# @home_page.visit_home_page
