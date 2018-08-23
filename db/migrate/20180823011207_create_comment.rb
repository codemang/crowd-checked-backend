class CreateComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :highlight, index: true, foreign_key: true
    end
  end
end
