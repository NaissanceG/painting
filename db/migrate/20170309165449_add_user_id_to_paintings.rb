class AddUserIdToPaintings < ActiveRecord::Migration[5.0]
  def change
    add_reference :paintings, :user, foreign_key: true
  end
end
