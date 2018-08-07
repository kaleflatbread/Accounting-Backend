class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.string :transaction_type
      t.integer :account_id
      t.integer :user_id
      t.string :memo
      t.integer :je_num
      t.date :date

      t.timestamps
    end
  end
end
