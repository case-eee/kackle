class Joke < ApplicationRecord
  validates :question, presence: true
  validates :answer, presence: true

  def full
    question + " " + answer
  end

  def self.random
    order("RANDOM()").sample
  end
end
