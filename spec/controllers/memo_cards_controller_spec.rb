require 'rails_helper'

RSpec.describe MemoCardsController, :type => :controller do
    before do
      @tal_test = 1
      @memo_card = MemoCard.new(:word => 'test' , :word_id => 1)
      @memo_cards = MemoCard.all

    end

    context  "first rspec" do
      it "sets bla bla" do
        expect(@tal_test).to eq(1)
      end
    end

    describe "#get_four_random_words" do
      context "all of them" do
        it "bla blsa" do
          expect(@memo_card.word_id).to eq(1)
        end
      end
    end
 end


