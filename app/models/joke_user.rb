class JokeUser < ApplicationRecord
  belongs_to :joke
  belongs_to :user

  validates :joke, uniqueness: { scope: :user }

end

