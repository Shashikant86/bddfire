require 'spec_helper'

# These are just demo test, please contribue to the cucumber tests in the features directories

RSpec.describe 'False positive test to check if bddfire has created Cucumber directoey', :type => :aruba do
  let(:directory) { 'cucumber' }
 
  before(:each) { create_directory(directory) }

  it { expect(exist?(directory)).to be true }
end