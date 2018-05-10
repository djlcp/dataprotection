class ChangeColumn < ActiveRecord::Migration[5.1]
  def up
    change_column :articles, :number, :integer
  end
  def down
    change_column :articles, :number, :string
  end
end
