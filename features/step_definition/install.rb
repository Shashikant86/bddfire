
Then(/^bddfire should be installed on the local system$/) do
  run('gem list bddfire')
  expect(last_command_started).to have_output(/bddfire/)
end

Then(/^output should be$/) do |output|
  expect(last_command_started).to have_output(output)
end

Then(/^output should be contain$/) do |string|
  expect(last_command_started).to include?(output)
end