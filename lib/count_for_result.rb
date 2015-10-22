module CountForResult
  #TODO - change from session to time created
  def count_for_result_from_module(user , session_id)
    result_correct = count_for_correct_result(user, session_id)
    result_wrong = count_for_wrong_result(user, session_id)
    respond_to do |format|
      format.json { render json: {right_answers: result_correct, wrong_answers: result_wrong}}
    end
  end

  def count_for_correct_result(user , session_id)
    Results.select(:id).where(is_correct: 1 , user_id: user.id , session_id: session_id ).length.to_s
  end

  def count_for_wrong_result(user , session_id)
    Results.select(:id).where(is_correct: 0 , user_id: user.id , session_id: session_id).length.to_s
  end
end