class CreateCattype < ActiveRecord::Migration[5.1]
  def change
    create_table :category_types do |t|
      t.string :category_type_desc

      t.timestamps
    end
  end
end
