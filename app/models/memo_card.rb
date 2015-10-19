class MemoCard < ActiveRecord::Base
  has_many :posts
  attr_accessor :memo_card

  def is_memo_super_card?
    if memo_card.word == 'super'
      return true
    end
  end
end
