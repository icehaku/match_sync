class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :steam_id
      t.string :nick
      t.string :image

      t.timestamps null: false
    end
  end
end
