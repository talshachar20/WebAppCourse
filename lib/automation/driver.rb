require 'selenium-webdriver'
require 'test_helper'
#require 'rspec-expectations'

def setup

  #profile = Selenium::WebDriver::Firefox::Profile.new
  #profile["general.useragent.override"] = "Mozilla/5.0 (iPhone; U; CPU like Mac OS X"
  @driver = Selenium::WebDriver.for :chrome #, :profile => profile
  ENV['base_url'] = 'http://0.0.0.0:3000/'
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end



