class AddTypeToCategories < ActiveRecord::Migration[5.1]
  def change
    add_reference :categories, :category_type, foreign_key: true
  end
end
