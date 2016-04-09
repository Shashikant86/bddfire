
When /^I send a (GET|PUT|POST|DELETE) request (?:for|to) "([^"]*)"(?: with the following:)?$/ do |*args|
    request_type = args.shift.downcase
    url = args.shift
    payload = args.shift
   
    if (payload.nil? && request_type == 'get')
    @response = RestClient.get url
    elsif (payload.nil? && request_type == 'delete')
     @response = RestClient.delete url
    elsif (payload && request_type == 'get')
     @response = RestClient.get url, payload	
    elsif (payload && request_type == 'post')
     @response = RestClient.post url, payload
    elsif (payload && request_type == 'put')
     @response = RestClient.post url, payload 
   end 
end

Then(/^the response should be JSON$/) do
   @data = JSON.parse(@response)
   expect(@data).not_to be_empty
end


Then(/^the response status code should be '(\d+)'$/) do |code|
  status_code = @response.code
  expect(status_code).to be == code.to_i
end

Then(/^the JSON response should have '(\d+)' properties$/) do |count|
  expect(@data.keys.count).to be == count.to_i
end

Then(/^the JSON response has a "([^"]*)" property$/) do |property|
  json_property = @data.has_key?(property)
  expect(json_property).to be_truthy
end

Then(/^the JSON "([^"]*)" property equals "([^"]*)"$/) do |property, value|
  expect(@data[property]).to be == value 
end

Then(/^the JSON response header has key "([^"]*)" with value of "([^"]*)"$/) do |key, value|
	@headers = @response.headers
	expect(@headers.keys).to include(key.to_sym)
	expect(@headers.values).to include(value)
end

Then(/^the JSON response should be$/) do |string|
  actual = JSON.parse(string)
  expect(@data).to be == actual
end

Then(/^the response should be XML$/) do
   @xml_data = Nokogiri::XML(@response)
   expect(@xml_data).not_to be_empty
end

Then /^the XML response should (not)?\s?have "([^"]*)"$/ do |negative, xpath|
  parsed_response = Nokogiri::XML(@response)
  elements = parsed_response.xpath(xpath)
  if self.respond_to?(:expect)
    if negative.present?
      expect(elements).to be_empty
    else
      expect(elements).not_to be_empty
    end
  else
    if negative.present?
      assert elements.empty?
    else
      assert !elements.empty?
    end
  end
end

Then /^the XML response should have "([^"]*)" with the text "([^"]*)"$/ do |xpath, text|
  parsed_response = Nokogiri::XML(@response)
  elements = parsed_response.xpath(xpath)
  if self.respond_to?(:expect)
    expect(elements).not_to be_empty, "could not find #{xpath} in:\n#{last_response.body}"
    expect(elements.find { |e| e.text == text }).not_to be_nil, "found elements but could not find #{text} in:\n#{elements.inspect}"
  else
    assert !elements.empty?, "could not find #{xpath} in:\n#{last_response.body}"
    assert elements.find { |e| e.text == text }, "found elements but could not find #{text} in:\n#{elements.inspect}"
  end
end




