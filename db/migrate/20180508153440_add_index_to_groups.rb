class AddIndexToGroups < ActiveRecord::Migration[5.1]
  def change
    add_index :groups, :title, unique: true
  end
end
