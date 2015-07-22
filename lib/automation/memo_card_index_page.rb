require_relative 'base_page'
require_relative 'login_page'
require_relative 'memo_card_page'
require_relative 'new_memo_card_page'
require 'pry'
require 'capybara/node/finders'


class MemoCardIndexPage < Base

  attr_reader :driver ,  :selectors
  def initialize(driver)
    super(driver)
    initialize_selectors
  end

  def new_design_status
    text_of @selectors[:NEW_DESIGN_TEXT]
  end

  def num_of_memo_cards
    word_status_array = find_elements @selectors[:WORD_STATUS_COLUMN]
    word_status_array.size
  end

  def choose_text_memo_card_by_index(index)
    return text_of(selector_builder_for_memo_card_table(index))
  end

  def click_memo_card_by_index(index)
    current_memo = selector_builder_for_test_yourself_memo_card_table(index)
    click_on(current_memo)
    return QuestionPage.new(@@driver)
  end

  def count_memo_cards
    memo_cards_num = find_elements selectors[:MEMO_CARD_LIST]
    return memo_cards_num.count
  end

  def click_on_new_memo_card
    puts "navigating to new memo card page"
    new_memo_card_page =  (selectors[:NEW_MEMO_CARD_BUTTON])
    click_on new_memo_card_page
    return NewMemoCardPage.new(@@driver)
  end

  private

  def selector_builder_for_memo_card_table(param)
    return {xpath: '//*[@id="newDesign"]/tbody/tr['+param.to_s+']/td[1]' }
  end

  def selector_builder_for_test_yourself_memo_card_table(param)
    return {xpath: '//*[@id="newDesign"]/tbody/tr['+param.to_s+']/td[5]' }
  end


  def initialize_selectors
    @selectors = {
        :NEW_DESIGN_TEXT => {id: 'newDesign'} ,
        :WORD_STATUS_COLUMN =>  {id: 'statusBar'} ,
        :MEMO_CARD_LIST => {xpath:  '/html/body/table/tbody'} ,
        :NEW_MEMO_CARD_BUTTON => {id: 'create_new_memo_card'}
    }
  end

end
