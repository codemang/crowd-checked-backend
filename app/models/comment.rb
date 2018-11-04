class Comment < ActiveRecord::Base
  belongs_to :highlight
  belongs_to :user
  has_many :comment_votes
end
