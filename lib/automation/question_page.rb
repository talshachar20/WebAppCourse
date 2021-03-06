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
    all_answers = Array[]
    answers_array = [text_of(selectors[:ANSWER1]), text_of(selectors[:ANSWER2]), text_of(selectors[:ANSWER3]), text_of(selectors[:ANSWER4])]
    answers_array.each do |answer|
      puts answer
      all_answers << (answer).to_s
    end
    return all_answers
  end

  def get_all_answers_as_objects
    all_answers = Array[]
    answers_array = [(selectors[:ANSWER1]), (selectors[:ANSWER2]), (selectors[:ANSWER3]), (selectors[:ANSWER4])]
    answers_array.each do |answer|
      puts answer
      all_answers << (answer)
    end
    return all_answers
  end

  def find_answer_by_word(word)
    get_all_answers.each do |answer|
      if answer == word
        return true
      end
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

  def click_on_answer_by_word(given_answer)
    get_all_answers_as_objects.each do |answer|
      if text_of(answer) == given_answer
        click_on(answer)
      end
    end
  end

  def get_answer_status
    #TODO - fix  , returns x
    text_of(selectors[:ANSWER_STATUS])
  end
  
  def back_to_index_page
     click_on selectors[:BACK_BUTTON]
     return MemoCardIndexPage.new(@@driver)
  end

  private
  def initialize_selectors
    @selectors = {
        :QUESTION => {id: 'question'} ,
        :ANSWER1 => {id: 'answer1'},
        :ANSWER2 => {id: 'answer2'},
        :ANSWER3 => {id: 'answer3'},
        :ANSWER4 => {id: 'answer4'},
        :ANSWER_STATUS => {id: 'theAnswerIs'},
        :BACK_BUTTON => {xpath: '/html/body/a[2]'}
    }
  end
end
