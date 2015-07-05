require_relative 'base_page'
require_relative 'login_page'
require_relative 'memo_card_page'
require 'pry'
require 'capybara/node/finders'


class MemoCardIndexPage < Base

  attr_reader :driver
  def initialize(driver)
    super(driver)
  end

  NEW_DESIGN_TEXT = {id: 'newDesign'}
  WORD_STATUS_COLUMN = {id: 'statusBar'}
  MEMO_CARD_LIST = {xpath:  '/html/body/table/tbody'}
  MEMO_CARD_BY_INDEX = {xpath: '/html/body/table/tbody/tr[index]'}

  def new_design_status
    text_of NEW_DESIGN_TEXT
  end

  #TODO - build function to count memo cards
  def num_of_memo_cards
    word_status_array = find_elements WORD_STATUS_COLUMN
    word_status_array.size
  end

  def choose_memo_card_by_index(index)
    find_elements MemoCardIndexPage
  end
end