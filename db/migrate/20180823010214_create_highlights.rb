class CreateHighlights < ActiveRecord::Migration[5.2]
  def change
    create_table :highlights do |t|
      t.text :body
      t.string :url
      t.timestamps
    end
  end
end
