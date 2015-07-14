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
        :NEW_DESIGN_TEXT => {id: 'newDesigdn'} ,
        :WORD_STATUS_COLUMN =>  {id: 'statusBar'} ,
        :MEMO_CARD_LIST => {xpath:  '/html/body/table/tbody'} ,
        #:MEMO_CARD_BY_INDEX=> {:xpath=> "id('newDesign')/x:tbody/x:tr/x:td[6]"}
    }
  end

  def selector_builder(selector_string, param)
     selector = "id('newDesign')/x:tbody/x:tr/x:td[6]"
     selector_key = ':MEMO_CARD_BY_INDEX'
     return {xpath: selector}
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
    binding.pry
    puts selector_builder("cc", "1")
    #puts 'value is: ' + value
  end
end
