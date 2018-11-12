class AddGcmTokenToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :gcm_token, :string
  end
end