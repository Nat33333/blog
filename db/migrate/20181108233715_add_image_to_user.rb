class AddImageToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :avatar_image, :string, default: "avatars/unknownunknown.png"
  end
end