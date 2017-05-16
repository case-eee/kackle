require 'rails_helper'

describe JokeUser do
  it {should belong_to(:user)}
  it {should belong_to(:joke)}
end


