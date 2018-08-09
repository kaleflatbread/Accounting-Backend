class User < ApplicationRecord
  validates :first_name, :last_name, :role, :email, presence: true
  validates :email, uniqueness: true
  # has_secure_password
end
