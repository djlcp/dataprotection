class AddIndexToCategories < ActiveRecord::Migration[5.1]
  def change
    add_index :categories, [:title, :group_id], unique: true

  end
end
