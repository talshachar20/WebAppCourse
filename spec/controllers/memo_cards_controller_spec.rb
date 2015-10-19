require_relative '../../spec/rails_helper'
require_relative '../spec_helper'
require 'pry'
require_relative '../../spec/factories/users'
include Devise::TestHelpers


RSpec.describe MemoCardsController do
    before do
      MemoCard.destroy_all
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
          MemoCard.destroy_all
          User.destroy_all
          @user = create(:user)
          @memo_card = create(:memo_card)
          sign_in @user
        end

        it "should add new memo card" do
        end
      end
    end
 end


