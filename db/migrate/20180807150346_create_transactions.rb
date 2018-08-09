class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :type, null: false
      t.string :transaction_type
      t.belongs_to :account
      t.belongs_to :user
      t.date :date
      t.string :memo
      t.integer :amount
      t.integer :quantity_change
      t.integer :cost_per_unit
      t.string :sku

      t.timestamps
    end
  end
end
