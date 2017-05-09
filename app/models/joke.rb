class Joke < ApplicationRecord
  validates :question, presence: true
  validates :answer, presence: true

  def full
    question + " " + answer
  end
end
