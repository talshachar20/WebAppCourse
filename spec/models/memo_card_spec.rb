require 'rails_helper'
require_relative '../../spec/spec_helper'
require_relative '../../lib/answer_selector'
require_relative '../../app/controllers/memo_cards_controller'
require_relative '../../lib/check_answers'

describe AnswerSelector do
  include AnswerSelector

  entry_data = {
    default_wrong_answer: 'default'
  }

  context 'when calling 4 answers method' do
    before do
      MemoCard.destroy_all
      FactoryGirl.reload
      @memo_card = MemoCard.create(word: 'talTest', translation: 'test')
      @memo_card_first = FactoryGirl.create(:memo_card_first)
      @memo_card_second = FactoryGirl.create(:memo_card_second)
      @memo_card_third = FactoryGirl.create(:memo_card_third)
      @user = User.create(email: 'example@test.com', password: 'test', user_type: 1)
    end

    context 'with the same lang_id' do
      subject {get_four_random_words_from_module(@user)}
      it "includes the correct answer" do
        expect(subject).to include('test')
      end

      it "not includes wrong answers if it is not the correct lang_id" do
        expect(subject).not_to include('my')
      end

      it 'includes wrong answers if its from correct lang_id' do
        @memo_card_first.update(lang_id: 1)
        expect(subject).to include('my').or include('yours').or include('his')
        expect(subject).not_to include(entry_data[:default_wrong_answer])
      end

      it 'return defaults answers when there are no other matches' do
        @user.update(user_type: 2)
        expect(subject).to include(entry_data[:default_wrong_answer])
      end
     end
  end
end

describe CountForResult do
  include CountForResult
  before (:example) do
    Results.destroy_all
    @user = User.create(id: 1, email: 'example@test.com', password: 'test' , user_type: 1)
    @result = Results.create(user_id: @user.id, is_correct: 1, created_at: Time.zone.now.beginning_of_day+1)
    @result2 = Results.create(user_id: @user.id, is_correct: 1, created_at: Time.zone.now.beginning_of_day+1)
  end

  context 'when we have correct results for user' do
    subject {count_for_correct_result(@user, '3')}
    it 'counts them' do
      expect(subject).to eq('2')
    end

    it 'counts only for this specific user' do
      @user2 = User.create(id: 2 , email: 'example2@test.com', password: 'test', user_type: 1)
      @result3 = Results.create(user_id: @user2.id, is_correct: 1, session_id: '3')
      expect(subject).to eq('2')
    end

    it 'has the same user but wrong results before the specific day' do
      @result2.update(created_at: Time.zone.now.beginning_of_day-1)
      expect(subject).to eq('1')
    end
  end

  context 'when we dont have any correct results per user' do
    subject {count_for_correct_result(@user, '3')}
    it 'returns zero' do
      @result.update(user_id: '30')
      @result2.update(user_id: '30')
      expect(subject).to eq('0')
    end
  end

  context 'when we have wrong results for user' do
    before {
      @result.update(is_correct: 0)
      @result2.update(is_correct: 0)
    }
    subject {count_for_wrong_result(@user, '3')}
    it 'counts them' do
      expect(subject).to eq('2')
    end

    it 'counts only for this specific user' do
      @user2 = User.create(id: 2, email: 'example2@test.com', password: 'test', user_type: 1)
      @result3 = Results.create(user_id: @user2.id, is_correct: 0, session_id: '3')
      expect(subject).to eq('2')
    end

    it 'has the same user but results are not from this specific day' do
      @result2.update(:created_at => Time.zone.now.beginning_of_day-1)
      expect(subject).to eq('1')
    end
  end

  context 'when we dont have any wrong results per user' do
    subject {count_for_wrong_result(@user, '3')}
    it 'returns zero' do
      @result.update(user_id: '30')
      @result2.update(user_id: '30')
      expect(subject).to eq('0')
    end
  end
end

describe CheckAnswers do
  include CheckAnswers

  before do
    @user = User.create(id: 1, email: 'example@test.com', password: 'test', user_type: 1)
    @memo_card = MemoCard.create(word: 'talTest', translation: 'test')
  end

  context 'given word and translation match'do
    subject {check_for_right_answer(@memo_card.translation, @memo_card.word)}
    it 'returns object' do
       expect(subject.blank?).not_to be_nil
    end
  end

  context 'given word and translation not match' do
    subject {check_for_right_answer('false translation', @memo_card.word)}
    it 'returns blank' do
      expect(subject.blank?).to be(true)
    end
  end

  context 'given word and translation are nil' do
    subject {check_for_right_answer(nil , nil)}
    it 'returns blank' do
      expect(subject.blank?).to be(true)
    end
  end
end
