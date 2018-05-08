class AddIndexToArticles < ActiveRecord::Migration[5.1]
  def change
    add_index :articles, [:category_id , :number, :suffix], unique: true
  end
end
