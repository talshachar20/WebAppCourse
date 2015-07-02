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

  def new_design_status
    text_of NEW_DESIGN_TEXT
  end

  #TODO - build function to count memo cards
  def num_of_memo_cards
    word_status_array = find_elements WORD_STATUS_COLUMN
    word_status_array.size
  end
end