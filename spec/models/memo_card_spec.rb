require 'rails_helper'
require_relative '../../spec/spec_helper'
require_relative '../../lib/answer_selector'
require_relative '../../app/controllers/memo_cards_controller'
require_relative '../../config/initializers/devise'


describe AnswerSelector do
  include AnswerSelector
  subject {get_four_random_words_from_module(@user)}

  context 'when calling 4 answers method' do
    before (:example) do
      MemoCard.destroy_all
      FactoryGirl.reload
      @memo_card = MemoCard.create(:word => 'talTest' , :translation => 'test')
      @memo_card_first = FactoryGirl.create(:memo_card_first)
      memo_card_second = FactoryGirl.create(:memo_card_second)
      memo_card_third = FactoryGirl.create(:memo_card_third)
      @user = User.create(email: "example@test.com", password: "test" , user_type: 1)

    end

    context 'with the same lang_id' do
      it "includes the correct answer" do
        expect(subject).to include('test')
      end

      it "not includes wrong answers if it is not the correct lang_id" do
        expect(subject).not_to include('my')
      end

      it "includes wrong answers if its from correct lang_id" do
        @memo_card_first.update(:lang_id => 1)
        expect(subject).to include('my')
      end
     end

  end
end
