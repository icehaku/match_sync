class AddMatchField < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :owner, :string
    add_column :matches, :status, :string, default: "Open"
  end
end
