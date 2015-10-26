require 'yaml'

module CheckAnswers
  def check_answer_from_module(word_temp , word_german , user , user_session)
    user_session_from_controller = user_session
    word_in_page = word_temp
    word_in_german = word_german
    right_answer = MemoCard.select("id").where(translation: word_in_page , word: word_in_german)
    answer_id = MemoCard.select("id").where(word: word_in_german).first.to_param
    next_answer = get_next_word_id(answer_id , user)
    if right_answer.empty?
      wrong_answer_to_result(answer_id , user , user_session_from_controller)
      result_into_yaml(answer_id , user , user_session_from_controller , 0)
      respond_to do |format|
        format.json { render json: {answer:"false" , nextid:next_answer} }
      end
    else
      correct_answer_to_result(answer_id , user , user_session_from_controller)
      result_into_yaml(answer_id , user , user_session_from_controller , 1)
      respond_to do |format|
        format.json { render json: {answer:"true" , nextid:next_answer } }
      end
    end
  end

  private

  def get_next_word_id(answer_id , user)
    next_word_id = MemoCard.select("id").where("id >" + answer_id).where(lang_id: user.user_type).first.to_param
    if next_word_id == nil
      next_word_id = MemoCard.select("id").where("id <=" + answer_id).where(lang_id: user.user_type).first.to_param
      return next_word_id
    else
      return next_word_id
    end
  end

  def correct_answer_to_result(answer_id , user , session_id_from_controller)
    the_current_user = user.id
    session_id = session_id_from_controller
    Results.create(:user_id => the_current_user , :word_id => answer_id , :is_correct => 1 , :session_id => session_id)
    logger.debug "True result entered to user id:  #{the_current_user}"
  end

  def wrong_answer_to_result(answer_id , user , session_id_from_controller)
    the_current_user = user.id
    session_id = session_id_from_controller
    Results.create(:user_id => the_current_user , :word_id => answer_id , :is_correct => 0 , :session_id => session_id)
    logger.debug "Wrong result entered to user id:  #{the_current_user}"
  end

  def result_into_yaml(answer_id , user , user_session_from_controller , is_correct)
    @answers = {  user.id => ["user id" => user.id  , "word id" => answer_id ,  "is correct" => is_correct , "time created"=> Time.now , "session id" => user_session_from_controller]}
    output = File.new('results.yaml' , 'a+')
    output.puts YAML.dump(@answers)
    output.close
    got_data = YAML.load_file('results.yaml')
    subject = got_data[:Subject_list]
    puts "!!!*******!!!!" + got_data['word id'].to_yaml
  end
end