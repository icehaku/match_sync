class AddMatchPlayers < ActiveRecord::Migration
  def change
    add_column :matches, :player_3, :string
    add_column :matches, :player_4, :string
    add_column :matches, :player_5, :string
    add_column :matches, :player_6, :string
    add_column :matches, :player_7, :string
    add_column :matches, :player_8, :string
    add_column :matches, :player_9, :string
    add_column :matches, :player_10, :string
  end
end
