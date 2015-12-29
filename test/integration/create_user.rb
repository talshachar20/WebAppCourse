require_relative '../../test/test_helper'
require_relative '../../spec/spec_helper'
require_relative '../../app/controllers/memo_cards_controller'
require_relative '../../app/models/user'
require_relative '../../test/support/sign_in_support'
require_relative '../../spec/rails_helper'

describe User  do
  before(:each) do
    User.destroy_all
  end
  it 'returns new user' do
    active_user = create(:user , email: 'tazos123@gmail.com')
    expect(active_user.email).to eq('tazos123@gmail.com')
  end
end

describe MemoCard do
  before(:each) do
    MemoCard.destroy_all
  end
  it 'creates memo card' do
    memo_card = create(:memo_card)
    expect(memo_card.word).to eq('mein')
  end

  it 'updates random card' do
    memo_card = create(:memo_card)
    expect(memo_card.word).to eq('mein')
    memo_card_update = {word: 'dein', translation: 'yours'}
    memo_card.update(memo_card_update)
    expect(memo_card.word).to eq('dein')
  end
end
