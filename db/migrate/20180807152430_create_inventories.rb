class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.string :sku
      t.string :transaction_type
      t.integer :user_id
      t.integer :quantity_change
      t.integer :cost_per_unit
      t.integer :total_value
      t.date :date
      t.integer :transaction_id

      t.timestamps
    end
  end
end
