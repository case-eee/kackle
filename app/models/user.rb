class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :phone, presence: true
  has_many :joke_users
  has_many :jokes, through: :joke_users

  scope :active?, -> { where(active: true) }
end
