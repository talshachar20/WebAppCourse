module UserStatus
  def get_new_status_for_user_from_module(memo_cards, current_user_id)
    memo_cards.each do |memo_card|
      counter = $redis.get("correct_answers_for_user_" + current_user_id)
      #counter = (Results.select("word_id").where(word_id: memo_card.id , user_id: current_user_id , is_correct: 1)).length.to_s
      counter
    end
  end
end