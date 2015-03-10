require 'rails_helper'

RSpec.describe MemoCardsController, :type => :controller do
    before do
      @memo_card = MemoCard.new(:word => 'test' , :word_id => 1)
      @memo_cards = MemoCard.all

    end

    context  "first rspec" do
      it "Should be intance of memo_card " do
        @memo_card.should be_an_instance_of MemoCard
      end
    end

    describe "#get_four_random_words" do
      context "db values" do
        it "returns memo card if" do
          expect(@memo_card.word_id).to eq(1)
        end
        it "updated memo card id" do
          @memo_card.update(:word_id => 3)
          expect(@memo_card.word_id).to eq(3)
        end
        it "calls method" do
          @memo_card.check_answer.should include 'fdd'
        end
      end
    end
 end


