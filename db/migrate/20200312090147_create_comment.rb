class CreateComment < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment, null: false
      t.integer :target_id, null: false
      t.string :target_type, null: false
    end
  end
end
