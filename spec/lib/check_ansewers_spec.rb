require_relative '../spec_helper'
require_relative '../../spec/rails_helper'
require_relative '../../lib/check_answers'

RSpec.describe 'check answers module' do
  before {
    MemoCard.destroy_all
    @first_memo = FactoryGirl.create(:memo_card_first, word: "test2", translation: "test2")
    @second_memo = FactoryGirl.create(:memo_card_second)
  }

  let(:check_answer) {Class.new {extend CheckAnswers}}
  let(:user_test2) {FactoryGirl.create(:user, email: "blkabla@gmail.com")}
  subject{check_answer}

  context 'when sending match answer and question' do
    it 'returns true' do
      expect(subject.check_answer_from_module("test2", "test2", user_test2, "??", "false")).to include("true", @first_memo.id)
    end
  end

  context 'when sending non match answer and question' do
    it 'returns false' do
      expect(subject.check_answer_from_module("test3", "test2", user_test2, "??", "false")).to include("false")
    end
  end

  context 'when sending un recognizable data' do
    it 'returns false' do
      expect(subject.check_answer_from_module("test3", "test3", user_test2, "??", "false")).to include("false")
    end
  end
end
