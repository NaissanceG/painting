class AddPainterToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :painter, :boolean, default: false
  end
end
