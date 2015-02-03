class MemoCardsController < ApplicationController
  before_action :set_memo_card, only: [:show, :edit, :update, :destroy]

  # GET /memo_cards
  # GET /memo_cards.json
  def index
    @memo_cards = MemoCard.all
    @random_array = get_four_random_words
  end

  def get_four_random_words
    false_words = FalseWord.all
    random_word = false_words.sample.word  #random false word
    random_word_second = false_words.sample.word
    random_word_third = false_words.sample.word
    return answers = [random_word , random_word_second, random_word_third , "CORRECT"].shuffle
  end
  # GET /memo_cards/1
  # GET /memo_cards/1.json
  def show
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memo_card
      @memo_card = MemoCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memo_card_params
      params.require(:memo_card).permit(:word, :id, :translation, :word_id)
    end
end
