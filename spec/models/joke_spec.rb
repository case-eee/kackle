require 'rails_helper'

describe Joke do
  it {should validate_presence_of(:question)}
  it {should validate_presence_of(:answer)}
  it {should have_many(:users)}
  it {should have_many(:joke_users)}

  describe "#full" do
    it "returns the question and answer concatenated" do
      joke = create(:joke)
      expect(joke.full).to eq("What kind of car does Mickey Mouse's wife drive? A minnie van!")
    end
  end

  describe ".random" do
    it "returns a random Joke from the database" do
      user = create(:user)
      create_list(:joke, 2)
      expect(Joke.random(user)).to be_an_instance_of(Joke)
    end
  end
end

