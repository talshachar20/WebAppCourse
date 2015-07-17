require_relative 'base_page'
require_relative 'memo_card_index_page'
require_relative '../../lib/automation/memo_card_page'
require 'pry'

class LoginPage < Base

  attr_accessor :driver

  def initialize(driver)
    super(driver)
  end

  USER_MAIL_LOGIN = {id: 'user_email'}
  USER_PASSWORD = {id: 'user_password'}
  USER_REMEMBER_ME = {id: 'user_remember_me'}
  SUBMIT = {xpath: '//*[@id="new_user"]/div[5]/input'}

  def type_user_mail(user_mail)
    puts "typing #{user_mail} as user mail"
    user_mail_field = USER_MAIL_LOGIN
    clear user_mail_field
    type(user_mail_field, user_mail)
  end

  def type_password(password)
    puts "typing #{password} as password"
    user_password_field = USER_PASSWORD
    clear user_password_field
    type(user_password_field, password)
  end

  def submit_login
    puts 'submit login'
     click_on SUBMIT
     if get_adress == 'http://0.0.0.0:3000/memo_cards'
       puts 'go into main page'
       return MemoCardIndexPage.new(@@driver)
     else
       puts 'not valid login'
     end
    #TODO - add new object to main page
  end
end