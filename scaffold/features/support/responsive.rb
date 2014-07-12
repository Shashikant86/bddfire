def set_window_size(width, height)
    if Capybara.current_driver == :selenium
        Capybara.current_session.driver.browser.manage.window.resize_to(width, height)
    elsif Capybara.current_driver == :poltergeist
        Capybara.current_session.driver.resize(width, height)
    end
end

begin
    window_sizes = {
        :'320' => { :width => 320, :height => 480 },
        :'600' => { :width => 600, :height => 769 },
        :'770' => { :width => 770, :height => 1025 },
        :'1026' => { :width => 1026, :height => 1200 },
    }
    window_sizes.default = { :width => 994, :height=> 689 }
    size = window_sizes[(ENV['DEVICE'] || 'default').to_sym]
    set_window_size(size[:width], size[:height])
end