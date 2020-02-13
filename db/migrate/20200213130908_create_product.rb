class CreateProduct < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 50
      t.decimal :price
      t.string :description, limit: 255
      t.references :categories, foreign_key: true
    end
  end
end
