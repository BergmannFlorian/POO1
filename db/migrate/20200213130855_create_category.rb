class CreateCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, limit: 50
      t.string :description, limit: 255
    end
  end
end
