module AnswerSelector
  def get_four_random_words_from_module(user, memo_card_model, current_memo_card)
    false_words = memo_card_model.where.not(id: current_memo_card.id).where(lang_id: user.user_type)
    if false_words.empty?    #when there are no any other answers
      random_word = 'default'
      random_word_second = 'default'
      random_word_third = 'default'
    else
      random_word = false_words.sample.translation  #random false word
      random_word_second = false_words.sample.translation
      random_word_third = false_words.sample.translation
    end
    true_word = current_memo_card.translation  #the correct answer
    return answers = [random_word , random_word_second, random_word_third , true_word].shuffle
  end
end
