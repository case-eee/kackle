class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :phone, presence: true
  has_many :joke_users
  has_many :jokes, through: :joke_users

  scope :active?, -> { where(active: true) }
  before_save :clean_phone

  private
  def clean_phone
    self.phone = self.phone.gsub(/[^0-9]/, "")
    if self.phone[0] == '1'
      self.phone = "+" + self.phone
    else
      self.phone = "+1" + self.phone
    end
  end
end
