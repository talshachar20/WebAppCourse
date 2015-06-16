require_relative '../../lib/automation/memo_card_page'
require_relative '../test_helper'
require_relative '../../lib/automation/base_page'
require_relative '../../lib/automation/login_page'
require 'capybara/rspec'

describe 'Testing expirence' do

  #test "Verify_home_page" do
  #  home_page = MemoCardPage.new
  #  home_page.click_on_my_homepage_button
  #  assert_match 'learns', home_page.get_upper_part.text
  #end
  appTest = nil
  before(:each) do
    appTest = Base.new(Selenium::WebDriver.for :chrome)
  end

  after(:each) do
    appTest.quit
  end

  it 'should do it' do
    result = appTest.visit.get_login_link
    expect(result).to be == 'tal'
  end


end
