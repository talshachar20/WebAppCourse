class MemoCardsController < ApplicationController
  before_action :set_memo_card, only: [:show, :edit, :update, :destroy]

  # GET /memo_cards
  # GET /memo_cards.json
  #layout "random_card"
  #caches_page :index #cashes word index

  def index
    logger.debug "Memo cards page"
    @memo_cards = MemoCard.all
  end

  def get_four_random_words
    false_words = FalseWord.all
    random_word = false_words.sample.word  #random false word
    random_word_second = false_words.sample.word
    random_word_third = false_words.sample.word
    true_word = @memo_card.translation  #the correct answer
    return answers = [random_word , random_word_second, random_word_third , true_word].shuffle
  end
  # GET /memo_cards/1
  # GET /memo_cards/1.json
  def show
    @random_array = get_four_random_words
    @word_id_array = MemoCard.select("id")
  end

  # GET /memo_cards/new
  def new
    @memo_card = MemoCard.new
  end

  # GET /memo_cards/1/edit
  def edit
  end

  # POST /memo_cards
  # POST /memo_cards.json
  def create
    @memo_card = MemoCard.new(memo_card_params)
    expire_page :action => :index
    respond_to do |format|
      if @memo_card.save
        format.html { redirect_to @memo_card, notice: 'Memo card was successfully created.' }
        format.json { render :show, status: :created, location: @memo_card }
      else
        format.html { render :new }
        format.json { render json: @memo_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memo_cards/1
  # PATCH/PUT /memo_cards/1.json
  def update
    expire_page :action => :index
    respond_to do |format|
      if @memo_card.update(memo_card_params)
        format.html { redirect_to @memo_card, notice: 'Memo card was successfully updated.' }
        format.json { render :show, status: :ok, location: @memo_card }
      else
        format.html { render :edit }
        format.json { render json: @memo_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memo_cards/1
  # DELETE /memo_cards/1.json
  def destroy
    @memo_card.destroy
    respond_to do |format|
      format.html { redirect_to memo_cards_url, notice: 'Memo card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_answer()
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
        format.json { render json: {answer:"true" , nextid:next_answer} }
      end
    end
  end

  def count_for_result()
    session_id = session[:session_id]
    result_correct = Results.select(:id).where(is_correct: 1 , user_id: current_user , session_id: session_id ).length.to_s
    result_wrong = Results.select(:id).where(is_correct: 0 , user_id: current_user , session_id: session_id).length.to_s
    respond_to do |format|
      format.json { render json: {right_answers: result_correct, wrong_answers: result_wrong} }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memo_card
      @memo_card = MemoCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memo_card_params
      params.require(:memo_card).permit(:word , :translation, :word_id)
    end

    def get_next_word_id(answer_id)
      next_word_id = MemoCard.select("id").where("id >" + answer_id).first.to_param
      if next_word_id == nil
        return next_word_id = MemoCard.select("id").where("id <" + answer_id).first.to_param
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
