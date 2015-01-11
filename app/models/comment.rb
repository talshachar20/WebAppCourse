class Comment < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :post_id
  validates_presence_of :body
  validates_presence_of :nickname
end
