class AddSunkToShips < ActiveRecord::Migration[4.2]
  def change
    add_column :ships, :sunk, :boolean, :default => false
  end
end