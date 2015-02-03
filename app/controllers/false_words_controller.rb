class FalseWordsController < ApplicationController
  before_action :set_false_word, only: [:show, :edit, :update, :destroy]

  # GET /false_words
  # GET /false_words.json
  def index
    @false_words = FalseWord.all
  end

  # GET /false_words/1
  # GET /false_words/1.json
  def show
  end

  # GET /false_words/new
  def new
    @false_word = FalseWord.new
  end

  # GET /false_words/1/edit
  def edit
  end

  # POST /false_words
  # POST /false_words.json
  def create
    @false_word = FalseWord.new(false_word_params)

    respond_to do |format|
      if @false_word.save
        format.html { redirect_to @false_word, notice: 'False word was successfully created.' }
        format.json { render :show, status: :created, location: @false_word }
      else
        format.html { render :new }
        format.json { render json: @false_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /false_words/1
  # PATCH/PUT /false_words/1.json
  def update
    respond_to do |format|
      if @false_word.update(false_word_params)
        format.html { redirect_to @false_word, notice: 'False word was successfully updated.' }
        format.json { render :show, status: :ok, location: @false_word }
      else
        format.html { render :edit }
        format.json { render json: @false_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /false_words/1
  # DELETE /false_words/1.json
  def destroy
    @false_word.destroy
    respond_to do |format|
      format.html { redirect_to false_words_url, notice: 'False word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_false_word
      @false_word = FalseWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def false_word_params
      params.require(:false_word).permit(:word_id, :word, :level)
    end
end
