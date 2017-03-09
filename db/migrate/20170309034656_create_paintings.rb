class CreatePaintings < ActiveRecord::Migration[5.0]
  def change
    create_table :paintings do |t|
      t.string :artist
      t.string :condition
      t.integer :price

      t.timestamps
    end
  end
end
