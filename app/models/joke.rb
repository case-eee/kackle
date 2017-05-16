class Joke < ApplicationRecord
  validates :question, presence: true
  validates :answer, presence: true
  has_many :joke_users
  has_many :users, through: :joke_users

  def full
    question + " " + answer
  end

  def self.random(user)
    used = JokeUser.where(user: user).pluck(:joke_id)
    where.not(id: used).order("RANDOM()").first
  end
end
