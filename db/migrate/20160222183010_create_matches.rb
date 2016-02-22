class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :player_1
      t.string :player_2

      t.timestamps null: false
    end
  end
end
