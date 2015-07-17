require_relative 'memo_card_page'
require_relative 'memo_card_index_page'
require_relative 'base_page'

class NewMemoCardPage < Base
  attr_reader :driver, :selectors

  def initialize(driver)
    super(driver)
    initialize_selectors
  end

  def initialize_selectors
    @selectors = {
        :MEMO_CARD_WORD => {id: 'memo_card_word'} ,
        :MEMO_CARD_TRANSLATION => {id: 'memo_card_translation'},
        :MEMO_CARD_SUBMIT => {name: 'commit'}
    }
  end

  def type_memo_card_word(word)
    puts "typing #{word} as memo card word"
    type(selectors[:MEMO_CARD_WORD], word)
  end

  def type_memo_card_translation(translation)
    puts "typing #{translation} as memo card word"
    type(selectors[:MEMO_CARD_TRANSLATION], translation)
  end

  def submit_memo_Card
    click_on(selectors[:MEMO_CARD_SUBMIT])
    #TODO - return memo page
  end

end