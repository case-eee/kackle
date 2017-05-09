require 'rails_helper'

describe User do
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:phone)}
  it {should have_secure_password}

  describe ".active?" do
    it "returns all the active users" do
      user1, user2 = create_list(:user, 2)
      user3 = create(:user, active: false)

      expect(User.active?.count).to eq(2)
    end
  end
end
