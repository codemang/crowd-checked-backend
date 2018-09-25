class AddApiTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :api_token, :string, null: false
  end
end
