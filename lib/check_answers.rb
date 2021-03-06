require 'yaml'

module CheckAnswers
  def check_answer_from_module(word_temp , word_german , user , user_session, is_admin)
    user_session_from_controller = user_session
    word_in_page = word_temp.to_s
    word_in_german = word_german.to_s
    right_answer = check_for_right_answer(word_in_page, word_in_german)
    @dbgResults = ""
    answer_id = MemoCard.select("id").where(word: word_in_german).first.to_param
    if answer_id == nil
      answer_id = "0" #edge case if there is no id for it in the database
    end
    next_answer = get_next_word_id(answer_id, user)
      if right_answer.empty?
        wrong_answer_to_result(answer_id, user , user_session_from_controller)
        $redis.setnx( "wrong_answers_for_user_" + user.id.to_s , 0) #save to redis
        $redis.incr("wrong_answers_for_user_" + user.id.to_s)
        return "false", next_answer
      else
        correct_answer_to_result(answer_id , user , user_session_from_controller)
        $redis.setnx("correct_answers_for_user_" + user.id.to_s, 0) #save to redis
        $redis.incr("correct_answers_for_user_" + user.id.to_s )
        return "true", next_answer
      end
  end

  def check_for_right_answer(translation,word )
    MemoCard.select("id").where(translation: translation, word: word)
  end

  def get_next_word_id(answer_id , user)
    next_word_id = MemoCard.select("id").where("id >" + answer_id).where(lang_id: user.user_type).first.to_param
    if next_word_id == nil
      next_word_id = MemoCard.select("id").where("id <=" + answer_id).where(lang_id: user.user_type).first.to_param
      return next_word_id
    else
      return next_word_id
    end
  end

  def correct_answer_to_result(answer_id, user, session_id_from_controller)
    the_current_user = user.id
    session_id = session_id_from_controller
    Results.create(user_id: the_current_user, word_id: answer_id, :is_correct => 1, session_id: session_id)
    #logger.debug "True result entered to user id:  #{the_current_user}"
  end

  def wrong_answer_to_result(answer_id, user, session_id_from_controller)
    the_current_user = user.id
    session_id = session_id_from_controller
    Results.create(user_id: the_current_user, word_id: answer_id, is_correct: 0, session_id:session_id)
    #logger.debug "Wrong result entered to user id:  #{the_current_user}"
  end
end
