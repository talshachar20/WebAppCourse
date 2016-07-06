require_relative 'base_page'
require_relative 'login_page'
require 'pry'
require 'capybara/node/finders'

class MemoCardPage < Base

  attr_reader :driver , :selectors
  def initialize(driver)
    super(driver)
    initialize_selectors
  end

  def get_my_status_button
    find selectors[:MY_STATUS_BUTTON]
  end

  def click_on_my_status
    puts "clicking on my status button"
    get_my_status_button.click
    return MemoCardPage.new(@@driver)
  end

  def get_home_page_button
    find selectors[:HOME_BUTTON]
  end

  def click_on_my_homepage_button
    puts "clicking on homepage button"
    get_home_page_button.click
  end

  def get_about_button
    find selectors[:ABOUT_BUTTON]
  end

  def click_on_about_button
    puts "clicking on about button"
    get_about_button.click
  end

  def search_result_present?(search_result)
    wait_for { displayed?(selectors[:UPPERPART]) }
    if text_of(selectors[:UPPERPART]).include? search_result
      puts "end !!"
    else
      puts "failed"
    end
  end

  def get_upper_part
    find selectors[:ALL_PAGE_TEXT]
  end

  def get_login_link
    return 'http://0.0.0.0:3000/users/sign_in'
  end

  def navigate_to_login_page
    puts "Navigating to login page"
    login = find selectors[:LOGIN_LINK]
    login.click
    return LoginPage.new(@@driver)
  end

  private

  def initialize_selectors
    @selectors = {
      :MY_STATUS_BUTTON => { xpath: '/html/body/div[1]/ul/li[2]'},
      :HOME_BUTTON => { xpath: '/html/body/div[1]/ul/li[1]/a'},
      :ABOUT_BUTTON =>  {xpath: '/html/body/div[1]/ul/li[3]/a'},
      :UPPERPART => { id: 'messages'  },
      :ALL_PAGE_TEXT => {xpath: '//*'},
      :LOGIN_LINK => {id: 'login_link'},
    }
  end
end
