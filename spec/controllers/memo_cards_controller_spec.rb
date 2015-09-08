require 'rails_helper'
require_relative '../spec_helper'
require 'pry'
include Devise::TestHelpers


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
        before (:each) do
          @user = create(:user)
          sign_in @user
        end

        let(:oneMemo) {MemoCardsController.new}
        it "should add new memo card" do
          @second_memo = MemoCard.new(:word => 'test2' , :word_id => 2)
          @memo_cards_library = [@memo_card , @second_memo]
          expect(@second_memo.word).to eq("test2")
          expect(@memo_cards_library.length).to eq(2)
          get :get_four_random_words
          response.code.should eq("200")
        end
      end
    end
 end


