module CountForResult
  def count_for_result_from_module(user , session_id)
    result_correct = Results.select(:id).where(is_correct: 1 , user_id: user , session_id: session_id ).length.to_s
    result_wrong = Results.select(:id).where(is_correct: 0 , user_id: user , session_id: session_id).length.to_s
    respond_to do |format|
      format.json { render json: {right_answers: result_correct, wrong_answers: result_wrong}}
    end
  end
end