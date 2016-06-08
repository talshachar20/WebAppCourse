require 'capybara/rspec'
require_relative 'stack_overflow_login_page'

describe 'Testing Stack overflow login page' do
  let(:login_page) {
    StackOverflowLoginPage.new(Selenium::WebDriver.for :chrome)
  }
  let(:entry_data) {
    {
          user_email:  'tal.shachar202@gmail.com',
          user_password:  'incorrectpassword'
    }
  }

  after(:each) do
    login_page.quit
  end
  context 'When login to stack overflow with incorrect password or user' do
    it 'should show the correct error message' do
      login_page.visit_login_page
      login_page.type_user_mail(entry_data[:user_email])
      login_page.type_password(entry_data[:user_password])
      login_page.submit_login
      expect(login_page.get_error_message).to include('The email or password is incorrect.')
    end
  end

  context 'When login to stack overflow without filling password field' do
    it 'should show the correct error message' do
      login_page.visit_login_page
      login_page.type_user_mail(entry_data[:user_email])
      login_page.type_password('')
      login_page.submit_login
      expect(login_page.get_error_message).to include('Password cannot be empty.')
    end
  end

  context 'When login to stack overflow without filling email field' do
    it 'should show the correct error message' do
      login_page.visit_login_page
      login_page.type_user_mail('')
      login_page.type_password(entry_data[:user_password])
      login_page.submit_login
      expect(login_page.get_error_message).to include('Email cannot be empty.')
    end
  end
end
