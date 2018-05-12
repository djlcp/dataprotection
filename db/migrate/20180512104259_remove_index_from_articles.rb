class RemoveIndexFromArticles < ActiveRecord::Migration[5.1]
  def change
    # remove_index :articles, :index_articles_on_category_id_and_number_and_suffix
    remove_index :articles, [:category_id, :number]
  end
end
