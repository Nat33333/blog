class AddShipsSunkToGames < ActiveRecord::Migration[4.2]
  def change
    add_column :games, :computer_ships_sunk, :integer, :default => 0
    add_column :games, :user_ships_sunk, :integer, :default => 0
  end
end