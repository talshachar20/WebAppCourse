require_relative 'base_page'
#require_relative 'test_helper'

class MemoCardPage < Base

  BUTTON        = { xpath: '/html/body/div[1]/ul/li[2]'}
  #SELECTORS[:acp_account_page_login_data] = Selector.new(:button, :xpath, '//*[@id="navi-side"]/ul/li[1]/a')
  SEARCH_BOX_SUBMIT = { id: 'gbqfb'     }
  UPPERPART = { xpath: '//*[@id="text-status"]/a[1]'  }

  def initialize
    super
    visit
  end

  def click_on_my_status
    my_status_button = find BUTTON
    my_status_button.click
  end

  def search_result_present?(search_result)
    wait_for { displayed?(UPPERPART) }
    if text_of(UPPERPART).include? search_result
      puts "end !!"
    else
      puts "failed"
    end
  end

  def get_upper_part_text
    upperpart_text = find UPPERPART
    return upperpart_text.text
  end

end

