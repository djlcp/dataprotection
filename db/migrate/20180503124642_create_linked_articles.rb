class CreateLinkedArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :linked_articles do |t|
      t.integer :article_id, index: true
      t.integer :article_a_id, index: true
      t.timestamps
    end
  end
end
