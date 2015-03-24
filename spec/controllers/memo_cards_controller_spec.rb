require 'rails_helper'
require 'spec_helper'
require 'pry'
require 'answer_selector'

RSpec.describe MemoCardsController, :type => :controller do
    before do
      @memo_card = MemoCard.create(:id => 9,:word => 'test' , :word_id => 1 , :translation => "blabla")
      @memo_card2 = MemoCard.create(:id => 1,:word => 'test2' , :word_id => 3 , :translation => "blabla2")
      @memo_cards = MemoCard.all
    end

    context  "first rspec" do
      it "Should be intance of memo_card " do
        @memo_card.should be_an_instance_of MemoCard
      end
    end

    describe "#test" do
      context "db values" do
        it "returns memo card if" do
          expect(@memo_card.word_id).to eq(1)
        end
        it "updated memo card id" do
          @memo_card.update(:word_id => 3)
          expect(@memo_card.word_id).to eq(3)
        end
      end

      context "new one"  do
        let(:oneMemo) {MemoCardsController.new}

        before do
          @memo_card.update_attributes(:id => 78)
          @memo_card2.update_attributes(:id =>2 )
          @memo_card3 = MemoCard.create(:id => 3,:word => 'test3' , :word_id => 3 , :translation => "blabla23")
          @daaay = oneMemo.stub(:get_four_random_words).and_return (@memo_card)
        end

        it "should add new memo card" do
          @second_memo = MemoCard.new(:word => 'test2' , :word_id => 2)
          @memo_cards_library = [@memo_card , @second_memo]
          expect(@second_memo.word).to eq("test2")
          expect(@memo_cards_library.length).to eq(2)
        end

        it "should mock @memo_card" do
          expect(@daaay).to eq(2)
        end


      end
    end
 end


