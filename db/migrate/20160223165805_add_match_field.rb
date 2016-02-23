class AddMatchField < ActiveRecord::Migration
  def change
    add_column :matches, :owner, :string
    add_column :matches, :status, :string, default: "Open"
  end
end
