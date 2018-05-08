class ChangeArticles < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :number , :integer
    add_column :articles, :suffix , :string 
  end
end
