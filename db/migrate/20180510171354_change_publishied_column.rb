class ChangePublishiedColumn < ActiveRecord::Migration[5.1]
  def up
    change_column :articles, :published, :boolean, default: false
  end
  def down
    change_column :articles, :published, :integer
  end
end
