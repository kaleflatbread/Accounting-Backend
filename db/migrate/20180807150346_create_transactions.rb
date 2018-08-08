class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :type, null: false
      t.string :transaction_type, default: "hi"
      t.belongs_to :account
      t.belongs_to :user
      t.integer :je_num, default: 1
      t.date :date, default: "hi"
      t.string :memo, default: "hi"
      t.integer :amount, default: 1
      t.integer :quantity_change, default: 1
      t.integer :cost_per_unit, default: 1
      t.string :sku, default: "hi"

      t.timestamps
    end
  end
end
