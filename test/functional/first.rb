require_relative '../../lib/automation/memo_card_page'
require_relative '../test_helper'
require_relative '../../lib/automation/base_page'
require_relative '../../lib/automation/login_page'

class First < ActiveSupport::TestCase

  #test "Verify_home_page" do
  #  home_page = MemoCardPage.new
  #  home_page.click_on_my_homepage_button
  #  assert_match 'learns', home_page.get_upper_part.text
  #end



  test "url"  do
    home_page = MemoCardPage.new
    #binding.pry
    assert_equal(home_page.get_adress , 'http://0.0.0.0:3000/')
    home_page.click_on_my_status
    sleep(2)
    home_page.navigate_to_login_page
    login_page = LoginPage.new
    assert_equal(login_page.get_adress , 'http://0.0.0.0:3000/users/sign_in')
    #login_page = LoginPage.new
    #login_page.type_user_mail("taltest")
  end

  #test "User_login" do
  #  home_page = MemoCardPage.new
  #  home_page.click_on_my_status
  #  sleep(2)
  #  home_page.navigate_to_login_page
  #  login_page = LoginPage.new
  #  login_page.type_user_mail("taltest")
  #  #login_page.type_password ('taltestpassword')
  #end

end
