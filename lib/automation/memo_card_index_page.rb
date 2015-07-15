require_relative 'base_page'
require_relative 'login_page'
require_relative 'memo_card_page'
require 'pry'
require 'capybara/node/finders'


class MemoCardIndexPage < Base

  attr_reader :driver ,  :selectors
  def initialize(driver)
    super(driver)
    initialize_selectors
  end

  def initialize_selectors
    @selectors = {
        :NEW_DESIGN_TEXT => {id: 'newDesign'} ,
        :WORD_STATUS_COLUMN =>  {id: 'statusBar'} ,
        :MEMO_CARD_LIST => {xpath:  '/html/body/table/tbody'} ,
    }
  end


  def new_design_status
    text_of @selectors[:NEW_DESIGN_TEXT_2]
  end

  #TODO - build function to count memo cards
  def num_of_memo_cards
    word_status_array = find_elements @selectors[:WORD_STATUS_COLUMN]
    word_status_array.size
  end

  def choose_memo_card_by_index(index) #TODO - maybe build an array table
    return text_of(selector_builder_for_memo_card_table(index))
  end

  private

  def selector_builder_for_memo_card_table(param)
    return {xpath: '//*[@id="newDesign"]/tbody/tr/td['+param.to_s+']' }
  end
end
