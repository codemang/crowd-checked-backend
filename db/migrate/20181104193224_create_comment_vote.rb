class CreateCommentVote < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_votes do |t|
      t.integer :user_id
      t.integer :comment_id
      t.timestamp
    end
  end
end
