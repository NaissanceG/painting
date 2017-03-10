class AddImageToPaintings < ActiveRecord::Migration[5.0]
  
  def change
    add_column :paintings, :image, :string
  end
end
