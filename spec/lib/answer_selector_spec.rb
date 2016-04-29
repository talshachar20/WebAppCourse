require_relative '../spec_helper'
require_relative '../../spec/rails_helper'
require_relative '../../lib/answer_selector'
require 'rspec/active_model/mocks'

context 'My context' do

  before {
    MemoCard.destroy_all
  }

  let(:user_test2) { FactoryGirl.create(:user, email: 'blkabla@gmail.com', user_type: 1) }
  let(:answer_selector) { Class.new {extend AnswerSelector} }
  let(:memo_card) {FactoryGirl.create(:memo_card_first, word: 'test1', translation: 'test1', lang_id: 1)}
  let(:memo_card2) {FactoryGirl.create(:memo_card_second,id: 4, word: 'test2', translation: 'test2', lang_id: 1)}

  subject {answer_selector.get_four_random_words_from_module(user_test2, MemoCard, memo_card)}
  specify 'should return 4 answers' do
    subject.count.should eq(4)
  end
end