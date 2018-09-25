class AddUserToHighlight < ActiveRecord::Migration[5.2]
  def change
    add_column :highlights, :user_id, :integer
  end
end
