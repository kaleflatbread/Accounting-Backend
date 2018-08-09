class Account < ApplicationRecord
  validates :name, :number, presence: true
end
