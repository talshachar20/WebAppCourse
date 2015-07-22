require_relative 'new_memo_card_page'
require_relative 'base_page'

class QuestionPage < Base

  attr_reader :driver, :selectors

  def initialize(driver)
    super(driver)
    initialize_selectors
  end

  def get_question_text
    text_of selectors[:QUESTION]
  end

  def get_all_answers
    answers_array = [selectors[:ANSWER4], selectors[:ANSWER2], selectors[:ANSWER3], selectors[:ANSWER4]]
    answers_array.each do |answer|
     puts (text_of answer)
    end
  end

  def get_answer_text_by_index(index)
    case index
      when 1
        text_of selectors[:ANSWER1]
      when 2
        text_of selectors[:ANSWER2]
      when 3
        text_of selectors[:ANSWER3]
      when 4
        text_of selectors[:ANSWER4]
    end
  end

  private
  def initialize_selectors
    @selectors = {
        :QUESTION => {id: 'question'} ,
        :ANSWER1 => {id: 'answer1'},
        :ANSWER2 => {id: 'answer2'},
        :ANSWER3 => {id: 'answer3'},
        :ANSWER4 => {id: 'answer4'},
    }
  end
end