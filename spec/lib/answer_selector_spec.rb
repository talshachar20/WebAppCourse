require_relative "#{Rails.root}/spec/rails_helper"
require_relative "#{Rails.root}/lib/answer_selector"

context 'Answer selector module' do
  before {
    MemoCard.destroy_all
    User.destroy_all
  }

  let(:user_test2) { FactoryGirl.create(:user, email: 'blkabla@gmail.com', user_type: 1) }
  let(:answer_selector) { Class.new {extend AnswerSelector} }
  let(:memo_card) { FactoryGirl.create(:memo_card_first, word: 'test1', translation: 'test1', lang_id: 1) }

  subject {answer_selector.get_four_random_words_from_module(user_test2, MemoCard, memo_card)}

  context 'when requesting for answers' do
    it 'should return 4 answers' do
      subject.count.should eq(4)
    end
  end

  context 'when there are no other words in the database' do
    it 'returns default answers' do
      subject.should match_array(['default', 'default', 'default', 'test1'])
    end
  end

  context 'when adding memo card to the database' do
    let!(:extra_memo) { FactoryGirl.create(:memo_card_second,id: 4, word: 'test2', translation: 'test2', lang_id: 1) }
    it 'shows false answers when it exist on db and returns true answer only once' do
      subject.should match_array(['test2', 'test1', 'test2', 'test2'])
    end
  end
end
