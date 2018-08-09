class Transaction < ApplicationRecord
  validates :account_id, :transaction_type, :user_id, :memo, :date, :amount, presence: true
end
