class Transaction < ApplicationRecord
  validates :account_id, :child_type, :user_id, :memo, :date, :amount, presence: true
end
