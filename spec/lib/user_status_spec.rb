require_relative '../spec_helper'
require_relative '../../spec/rails_helper'
require_relative '../../lib/user_status'

describe 'My behaviour' do
  MemoCard.destroy_all
  @first_memo = FactoryGirl.create(:memo_card_first, word: 'test2', translation: 'test2', lang_id: 1)
  @second_memo = FactoryGirl.create(:memo_card_second, lang_id: 1)
  let(:user_status) { Class.new {extend UserStatus} }
  let(:memo_cards) {newHash = [@first_memo, @second_memo]}
  subject {user_status}
  it 'should do something' do

    subject.get_new_status_for_user_from_module(memo_cards, 1).should == false
  end
end