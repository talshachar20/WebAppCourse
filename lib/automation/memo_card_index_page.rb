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
        :NEW_MEMO_CARD_BUTTON => {id: 'create_new_memo_card'}
    }
  end


  def new_design_status
    text_of @selectors[:NEW_DESIGN_TEXT]
  end

  #TODO - build function to count memo cards
  def num_of_memo_cards
    word_status_array = find_elements @selectors[:WORD_STATUS_COLUMN]
    word_status_array.size
  end

  def choose_memo_card_by_index(index) #TODO - maybe build an array table
    return text_of(selector_builder_for_memo_card_table(index))
  end

  def count_memo_cards
    memo_cards_num = find_elements selectors[:MEMO_CARD_LIST]
    return memo_cards_num.count
  end

  def click_on_new_memo_card
    new_memo_card_page = find (selectors[:NEW_MEMO_CARD_BUTTON])
    new_memo_card_page.click
    return NewMemoCardPage.new(@@driver)
  end

  private

  def selector_builder_for_memo_card_table(param)
    return {xpath: '//*[@id="newDesign"]/tbody/tr['+param.to_s+']/td[1]' }
  end

end
