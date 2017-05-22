class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :phone, presence: true
  has_many :joke_users
  has_many :jokes, through: :joke_users

  scope :active?, -> { where(active: true) }
  before_save :clean_phone

  def update_status(user_message)
    if user_message.upcase[0..2] == "YES"
      self.active = true
      self.save
    elsif user_message.upcase[0..1] == "NO" || user_message.upcase[0..10] == "UNSUBSCRIBE"
      self.active = false
      self.save
    end
  end

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
