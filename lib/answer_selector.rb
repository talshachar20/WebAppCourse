module AnswerSelector
  def get_four_random_words_from_module(user)
    false_words = MemoCard.where.not(id: @memo_card.id).where(lang_id: user.user_type)
    if false_words.empty?    #when there are no any other answers
      random_word = 'default'
      random_word_second = 'default'
      random_word_third = 'default'
    else
      random_word = false_words.sample.translation  #random false word
      random_word_second = false_words.sample.translation
      random_word_third = false_words.sample.translation
    end
    true_word = @memo_card.translation  #the correct answer
    return answers = [random_word , random_word_second, random_word_third , true_word].shuffle
  end

  def console_test
    puts "console testss"
  end
end