class CreateInfographics < ActiveRecord::Migration[5.1]
  def change
    create_table :infographics do |t|
      t.timestamps
    end

		add_attachment :infographics, :image
  end
end
