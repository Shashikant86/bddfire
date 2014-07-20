require 'rubygems'
require 'bundler/setup'
require "capybara"
require 'bddfire'
require "cucumber"
require "rspec"
require 'selenium-webdriver'
require 'rbconfig'


Given(/^I am on the "(.*?)"$/) do |url|
  session = Capybara::Session.new(:poltergeist)
  session.visit(url)
end


