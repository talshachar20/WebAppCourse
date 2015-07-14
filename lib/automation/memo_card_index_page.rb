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
  @@index = ""

  def initialize_selectors
    @selectors = {
        :NEW_DESIGN_TEXT => {id: 'newDesigdn'} ,
        :WORD_STATUS_COLUMN =>  {id: 'statusBar'} ,
        :MEMO_CARD_LIST => {xpath:  '/html/body/table/tbody'} ,
        :MEMO_CARD_BY_INDEX =>   {xpath:   'id("newDesign")/x:tbody/x:tr/x:td[6]'}
        #:gerne_selected_tag => lambda { |tag| Locator.new(:list , :xpath, "//div[@id='program_region_landing_pages_attributes_0_app_genre_category_ids_chzn']/ul[@class='chzn-choices']//span[text()='#{tag}']/following-sibling::a") }
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
    value = find ("id('newDesign')/x:tbody/x:tr/x:td[5]/x:a")
    puts 'value is: ' + value
  end
end