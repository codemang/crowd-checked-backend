class AddArticleTitleToHighlight < ActiveRecord::Migration[5.2]
  def change
    add_column :highlights, :article_title, :string
  end
end
