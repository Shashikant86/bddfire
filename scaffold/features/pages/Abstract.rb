class Abstract
  def initialize(_session)
    @session = Capybara.current_session
  end

  def your_abstracted_method1
    # your code goes here
  end

  def your_abstracted_method2
    # your code goes here
  end
end
