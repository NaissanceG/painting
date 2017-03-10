class AddNameToPaintings < ActiveRecord::Migration[5.0]
  def change
    add_column :paintings, :name, :string
  end
end
