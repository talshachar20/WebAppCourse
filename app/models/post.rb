class Post < ActiveRecord::Base
  belongs_to :memo_card
  has_many :comments ,  dependent: :destroy
  validates_presence_of :title
  validates_presence_of :body
end
