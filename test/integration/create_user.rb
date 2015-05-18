require 'spec/spec_helper'
require 'test_helper'

class CREATE_USER
  setup do
    @memo = MemoCard.create(:id => 1, :word => 'taltest' , :translation => 'taltester')
  end

  context 'when we create new user' do
    should 'see it' do
      @memo = 1
    end
  end
end