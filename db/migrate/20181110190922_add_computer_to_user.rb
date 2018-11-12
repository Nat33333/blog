class AddComputerToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :computer, :boolean, :default => false
  end
end