require_relative '../../lib/automation/memo_card_page'
require_relative '../test_helper'
require_relative '../../lib/automation/base_page'
require_relative '../../lib/automation/login_page'
require 'capybara/rspec'
require_relative '../../spec/spec_helper'

describe 'Testing login page' do
  FactoryGirl.create(:languages)
  FactoryGirl.create(:user)
  #TODO - configure wait element
  #TODO - configure tags
  #TODO - configure db cleaner

  entry_data = {  #factory doesn't take from test db #TODO fix it
      :user_email => "tazos123@gmail.com",
      :user_password => "tazos128"
  }



  appTest = nil
  before(:each) do
    appTest = Base.new(Selenium::WebDriver.for :chrome)
  end

  after(:each) do
    #appTest.quit
  end
  context 'go to the login page' do
    it 'should asset url of login page' do
      result = appTest.visit_page.click_on_my_status
      sleep(1)
      result = result.navigate_to_login_page
      sleep(2)
      result_title = result.get_adress
      expect(result_title).to be == 'http://0.0.0.0:3000/users/sign_in'
    end

    it 'should login with credentials' do
      result = appTest.visit_page.click_on_my_status
      result  = result.navigate_to_login_page
      sleep(2)
      result.type_user_mail(entry_data[:user_email])
      result.type_password(entry_data[:user_password])
      binding.pry
      result.submit_login
      result.click_on_about_button
    end
  end
end
