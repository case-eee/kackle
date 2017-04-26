require 'rails_helper'

describe User do
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:phone)}
  it {should have_secure_password}
end
