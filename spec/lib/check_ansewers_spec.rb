require_relative '../spec_helper'
require_relative '../../spec/rails_helper'
require_relative '../../lib/check_answers'

RSpec.describe 'check answers module' do
  before {
    User.destroy_all
    @user_test = FactoryGirl.create(:user, id: 1)
    #@user_test2 = FactoryGirl.create(:user, email: "blkabla@gmail.com")
  }

  let(:check_answer) {Class.new {extend CheckAnswers}}
  let(:user_test2) {FactoryGirl.create(:user, email: "blkabla@gmail.com")}
  subject{check_answer.check_answer_from_module("test2", "test2", user_test2, "??", "false")}

  context 'when sending match answer and question' do
    it 'returns json' do
      expect(subject).to eq(1)
    end
  end
end