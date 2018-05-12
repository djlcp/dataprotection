class ChangeIndexOnArticles < ActiveRecord::Migration[5.1]
  def change
    # remove_column :articles, :suffix
    # remove_index :articles, [:category_id , :number, :suffix]
    # remove_index :index_articles_on_category_id_and_number_and_suffix
    add_index :articles, [:category_id , :number, :letter], unique: true
  end
end
