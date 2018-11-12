class ChangeBoardsColumnFormat < ActiveRecord::Migration[4.2]
  def change
    change_column :boards, :cells, :text
  end
end