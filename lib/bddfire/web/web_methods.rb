require 'net/https'

def check_valid_locator_type?(type)
  %w(id class css name xpath).include? type
end

def check_selector(type)
  raise "Please use correct locator only id,name,css,xpath are supported - #{type}" unless check_valid_locator_type? type
end

def check_valid_option_by?(option_by)
  %w(text value index).include? option_by
end

def validate_option_by(option_by)
  raise "Please select valid option, invalid option - #{option_by}" unless check_valid_option_by? option_by
end
