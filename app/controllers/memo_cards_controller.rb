require_relative '../../lib/answer_selector'
require_relative '../../lib/check_answers'
require_relative '../../lib/count_for_result'
require_relative '../../lib/user_status'
include AnswerSelector
include CheckAnswers
include CountForResult

class MemoCardsController < ApplicationController
  before_action :set_memo_card, only: [:show, :edit, :update, :destroy]

  attr_accessor :memo_card
  before_filter :authenticate_user!

  def index
    is_admin
    logger.debug 'Memo cards page'
    @memo_cards = MemoCard.all
  end

  def get_four_random_words
     get_four_random_words_from_module(current_user)
  end

  # TODO: get definition between words and phrases - add type of memo_card
  def show
    @random_array = get_four_random_words
    @word_id_array = MemoCard.select('id')
  end

  # GET /memo_cards/new
  def new
    @memo_card = MemoCard.new
  end

  # GET /memo_cards/1/edit
  def edit
  end

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

  def update
    expire_page action: :index
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

  def destroy
    @memo_card.destroy
    respond_to do |format|
      format.html { redirect_to memo_cards_url, notice: 'Memo card was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  def check_answer
    session_id = session[:session_id]
    is_admin = params[:dbg_mode]
    result = check_answer_from_module(params[:word_temp], params[:word_in_german], current_user, session_id, is_admin)
    respond_to do |format|
       format.json { render json: {answer:result[0], nextid:result[1]} }
     end
  end

  def count_for_result
    session_id = session[:session_id]
    is_admin = params[:dbg_mode]
    count_for_result_from_module(current_user, session_id, is_admin)
  end

  def get_new_status_for_user
    current_user_id = current_user.id
    get_new_status_for_user_from_module(@memo_cards, current_user_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memo_card
      @memo_card = MemoCard.find(params[:id])
    end

    def memo_card_params
      params.require(:memo_card).permit(:word, :translation, :word_id, :lang_id)
    end

    def is_admin
      admin = params[:admin]
      if admin == "true"
        puts "Admin mode"
      end
    end
end
