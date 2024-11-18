class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :genre
      t.string :device
      t.string :pickup_adress
      t.integer :num_players
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
