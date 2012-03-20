ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  
  # These helper methods were created for better undestanding of the "assert !x.valid?". It's 
  # more intuitive this way
  
  # This method negates the assert method

  def deny(condition, message='')
    assert !condition, message
  end  

  # This method abstracts the sentence .valid?

  def assert_invalid(record, message='')
    deny record.valid?, message
  end

end
