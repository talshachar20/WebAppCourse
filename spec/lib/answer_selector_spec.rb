require_relative '../../spec/rails_helper'
require_relative '../../lib/answer_selector'

context 'Answer selector module' do
  before {
    MemoCard.destroy_all
    User.destroy_all
  }

  let(:user_test2) { FactoryGirl.create(:user, email: 'blkabla@gmail.com', user_type: 1) }
  let(:answer_selector) { Class.new {extend AnswerSelector} }
  let(:memo_card) { FactoryGirl.create(:memo_card_first, word: 'test1', translation: 'test1', lang_id: 1) }

  subject {answer_selector.get_four_random_words_from_module(user_test2, MemoCard, memo_card)}
  it 'should return 4 answers' do
    subject.count.should eq(4)
  end

  it 'returns default answers when there are no others in the database' do
    #TODO look for a way to compare hash
    subject.should include('default')
  end

  it 'randomize the order of the answers' do
    #TODO look for a way to test shuffle
    #subject.should eq('test1')
  end

  it 'shows false answers when it exist on db' do
    #TODO look for a way to test shuffle
     FactoryGirl.create(:memo_card_second,id: 4, word: 'test2', translation: 'test2', lang_id: 1)
    subject.should include('test2', 'test1')
  end
end
