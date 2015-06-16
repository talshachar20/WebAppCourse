require_relative '../../lib/automation/memo_card_page'
require_relative '../test_helper'
require_relative '../../lib/automation/base_page'
require_relative '../../lib/automation/login_page'
require 'capybara/rspec'

describe 'Testing login page' do

  appTest = nil
  before(:each) do
    appTest = Base.new(Selenium::WebDriver.for :chrome)
  end

  after(:each) do
    appTest.quit
  end

  it 'should asset url of login page' do
    result = appTest.visit_page.click_on_my_status
    sleep(1)
    result = result.navigate_to_login_page
    sleep(2)
    result = result.get_adress
    expect(result).to be == 'http://0.0.0.0:3000/users/sign_in'
  end

end
