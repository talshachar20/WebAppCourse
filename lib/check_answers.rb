module CheckAnswers
  def check_answer_from_module
    word_in_page = params[:word_temp]
    word_in_german = params[:word_in_german]
    right_answer = MemoCard.select("id").where(translation: word_in_page , word: word_in_german)
    answer_id = MemoCard.select("id").where(word: word_in_german).first.to_param
    next_answer = get_next_word_id(answer_id)
    if right_answer.empty?
      wrong_answer_to_result(answer_id)
      respond_to do |format|
        format.json { render json: {answer:"false" , nextid:next_answer} }
      end
    else
      correct_answer_to_result(answer_id)
      respond_to do |format|
        format.json { render json: {answer:"true" , nextid:next_answer } }
      end
    end
  end

  private

  def get_next_word_id(answer_id)
    next_word_id = MemoCard.select("id").where("id >" + answer_id).where(lang_id: current_user.user_type).first.to_param
    if next_word_id == nil
      next_word_id = MemoCard.select("id").where("id <=" + answer_id).where(lang_id: current_user.user_type).first.to_param
      return next_word_id
    else
      return next_word_id
    end
  end

  def correct_answer_to_result(answer_id)
    the_current_user = current_user.id
    session_id = session[:session_id]
    Results.create(:user_id => the_current_user , :word_id => answer_id , :is_correct => 1 , :session_id => session_id)
    logger.debug "True result entered to user id:  #{the_current_user}"
  end

  def wrong_answer_to_result(answer_id)
    the_current_user = current_user.id
    session_id = session[:session_id]
    Results.create(:user_id => the_current_user , :word_id => answer_id , :is_correct => 0 , :session_id => session_id)
    logger.debug "Wrong result entered to user id:  #{the_current_user}"
  end
end