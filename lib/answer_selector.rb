

class AnswerSelector

  def initialize
    @memo_card = MemoCard.new(:id => 2 , :word => 'tal' , :translation => 'ddd')
  end
  def get_four_random_words
    #false_words = FalseWord.all
    false_words = MemoCard.where.not(id: @memo_card.id)
    random_word = false_words.sample.translation  #random false word
    random_word_second = false_words.sample.translation
    random_word_third = false_words.sample.translation
    true_word = @memo_card.translation  #the correct answer
    return answers = [random_word , random_word_second, random_word_third , true_word].shuffle
  end
end