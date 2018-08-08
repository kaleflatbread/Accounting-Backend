class Transaction < ApplicationRecord
  belongs_to :accounts
  belongs_to :users
end
