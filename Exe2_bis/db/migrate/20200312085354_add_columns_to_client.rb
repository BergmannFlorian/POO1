class AddColumnsToClient < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :type, :string, limit: 50
    add_column :clients, :name, :string, limit: 50
  end
end
