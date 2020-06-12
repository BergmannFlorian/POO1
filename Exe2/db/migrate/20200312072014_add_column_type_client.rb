class AddColumnTypeClient < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :type, :string
  end
end