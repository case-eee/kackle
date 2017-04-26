class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :phone, presence: true
end
