class Highlight < ActiveRecord::Base
  has_many :comments
  belongs_to :user
end
