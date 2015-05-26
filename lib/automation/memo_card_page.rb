require_relative 'driver'
require_relative 'base_page'
#require_relative 'test_helper'

class MemoCardPage < Base

  attr_reader :driver

  BUTTON        = { xpath: '/html/body/div[1]/ul/li[2]'}
  #SELECTORS[:acp_account_page_login_data] = Selector.new(:button, :xpath, '//*[@id="navi-side"]/ul/li[1]/a')
  SEARCH_BOX_SUBMIT = { id: 'gbqfb'     }
  UPPERPART = { xpath: '//*[@id="text-status"]/a[1]'  }

  def initialize(driver)
    super
    visit
    #verify_page
  end

  def visit(url='/')
    driver.get ENV['base_url']
    #driver.get('http://0.0.0.0:3000/')
  end

  def click_on_my_status
    find BUTTON
  end

  def search_result_present?(search_result)
    wait_for { displayed?(UPPERPART) }
    if text_of(UPPERPART).include? search_result
      puts "end !!"
    else
      puts "failed"
    end
  end

end

