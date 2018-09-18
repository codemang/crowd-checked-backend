class Comment < ActiveRecord::Base
  belongs_to :highlight
  belongs_to :user
end
