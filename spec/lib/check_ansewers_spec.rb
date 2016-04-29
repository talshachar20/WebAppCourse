require_relative '../spec_helper'
require_relative '../../spec/rails_helper'
require_relative '../../lib/check_answers'

RSpec.describe 'check answers module' do
  entry_data = {
    word: 'test2',
    translation: 'test2'
  }
  before {
    system('ls')  #very usable - system call
    MemoCard.destroy_all
    @first_memo = FactoryGirl.create(:memo_card_first, word: 'test2', translation: 'test2', lang_id: 1)
    @second_memo = FactoryGirl.create(:memo_card_second, lang_id: 1)
  }

  let(:check_answer) { Class.new {extend CheckAnswers} }
  subject { check_answer }
  let(:user_test2) { FactoryGirl.create(:user, email: 'blkabla@gmail.com') }

  context 'when sending match answer and question' do
    it 'returns true' do
      expect(subject.check_answer_from_module(entry_data[:word], entry_data[:translation], user_test2, '??', 'false')).to include('true', @second_memo.id.to_s)
    end
  end

  context 'when sending non match answer and question' do
    it 'returns false' do
      expect(subject.check_answer_from_module('test3', entry_data[:translation], user_test2, '??', 'false')).to include('false', @second_memo.id.to_s)
    end
  end

  context 'when sending un recognizable data' do
    it 'returns false' do
      expect(subject.check_answer_from_module('test3', 'test3', user_test2, '??', 'false')).to include('false')
    end
  end
end
