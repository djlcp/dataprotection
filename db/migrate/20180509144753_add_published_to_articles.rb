class AddPublishedToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :published, :integer
  end
end
