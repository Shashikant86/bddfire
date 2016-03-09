
Then(/^the response status code should be "(.*?)"$/) do |code|
  page_code = page.driver.status_code.to_s
  expect(page_code).to eq(code)
end

Then(/^response headers should contain "(.*?)"$/) do |expected_header|
  header = page.response_headers
  expect(header).to include(expected_header)
end

Then(/^page source should contain "(.*?)"$/) do |data|
  source = page.driver.source
  expect(source).to include(data)
end

When(/^I clear network traffic$/) do
  page.driver.clear_network_traffic
end

When(/^I called network traffic of the page$/) do
  page.driver.network_traffic.each do |request|
    request.response_parts.uniq(&:url).each do |response|
      puts "\n Responce URL #{response.url}: \n Status #{response.status}"
    end
  end
end

Then(/^network traffic should contains resource "(.*?)"$/) do |resource|
  traffic = page.driver.network_traffic
  expect(traffic).to include(resource)
end

When(/^I request response headers$/) do
  puts page.response_headers.to_a
end

When(/^I request page "(.*?)" with header name "(.*?)" value "(.*?)"$/) do |url, _name, _value|
  page.driver.headers = { '#{name}' => '#{value}' }
  visit(url)
end

When(/^I set the cookie name "(.*?)" with value "(.*?)"$/) do |name, value|
  page.driver.set_cookie(name, value)
end

Then(/^I should see the cookie "(.*?)"$/) do |cookie|
  cookies = page.driver.cookies
  expect(cookies).to include(cookie)
end

When(/^I removed cookie "(.*?)"$/) do |_arg1|
  page.driver.remove_cookie
end

When(/^I clear all cookies$/) do
  page.driver.clear_cookies
end

When(/^I visit page with base authorization user "(.*?)" and password "(.*?)"$/) do |user, password|
  # page.driver.headers = {'Authorization': 'Basic '+ Base64.encode64('username:password')};
  page.driver.basic_authorize(user, password)
end
