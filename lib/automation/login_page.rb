require_relative 'base_page'
require 'pry'

class LoginPage < Base

  attr_accessor :driver

  def initialize(driver)
    super(driver)
  end

  USER_MAIL_LOGIN = {id: 'user_email'}
  USER_PASSWORD = {id: 'user_password'}
  USER_REMEMBER_ME = {id: 'user_remember_me'}
  SUBMIT = {name: 'user_remember_me'}

  def type_user_mail(user_mail)
    puts 'typing #{user_mail} as user mail'
    user_mail_field = USER_MAIL_LOGIN
    user_mail_field.type user_mail
  end

  def type_password(password)
    puts 'typing #{password} as password'
    user_password_field = USER_PASSWORD
    type(user_password_field, password)
  end


end