require_relative 'memo_card_page'
require_relative 'memo_card_index_page'
require_relative 'base_page'

class NewMemoCardPage < Base

  attr_reader :driver
  def initialize(driver)
    super(driver)
  end

  def enter_new_memo_word
    puts "dfdfd"
  end

end