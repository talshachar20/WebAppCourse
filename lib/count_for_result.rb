module CountForResult
  #TODO - change from session to time created
  def count_for_result_from_module(user , session_id, is_admin)
    result_correct = count_for_correct_result(user, session_id)
    result_wrong = count_for_wrong_result(user, session_id)
    result_debug = debug_results_mode(user, session_id)
    respond_to do |format|
      format.json { render json: {right_answers: result_correct, wrong_answers: result_wrong, admin_user: is_admin, debug_results: result_debug}}
    end
  end

  def count_for_correct_result(user , session_id)
    Results.select(:id).where(is_correct: 1 , user_id: user.id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).length.to_s
  end

  def count_for_wrong_result(user , session_id)
    Results.select(:id).where(is_correct: 0 , user_id: user.id,  created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).length.to_s
  end

  def debug_results_mode(user, session_id)
    dbg_results = Results.select(:id, :is_correct, :created_at).where(user_id: user.id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    dbg_results.map {|i| [" record: " ,i.id, " is_correct? " ,i.is_correct, "time: " , i.created_at]}
  end
end
