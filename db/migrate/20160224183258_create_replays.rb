class CreateReplays < ActiveRecord::Migration[5.2]
  def change
    create_table :replays do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
