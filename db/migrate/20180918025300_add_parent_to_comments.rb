class AddParentToComments < ActiveRecord::Migration[5.2]
  def change
      add_column :comments, :parent, :integer
      add_column :comments, :user_id, :integer
      add_foreign_key :comments, :users

      rename_column :comments, :comment, :content

      remove_column :comments, :username, :string
  end
end
