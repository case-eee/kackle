require 'rails_helper'

describe User do
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:phone)}
  it {should have_secure_password}
  it {should have_many(:jokes)}
  it {should have_many(:joke_users)}

  describe ".active?" do
    it "returns all the active users" do
      user1, user2 = create_list(:user, 2)
      user3 = create(:user, active: false)

      expect(User.active?.count).to eq(2)
    end
  end

  describe 'when passed a phone number with non-numeric characters' do
    it 'should remove the non-numeric characters' do
      user = create(:user, phone: "+1(500)-400. ,3000")

      expect(user.phone).to eq("+15004003000")
    end
  end

  describe 'when passed a phone number without a leading one' do
    it 'should add +1 to the beginning of the number' do
      user = create(:user, phone: "(500)-400. ,3000")

      expect(user.phone).to eq("+15004003000")
    end
  end

  describe 'when passed a phone number with a leading one' do
    it 'should not add +1 to the beginning of the number' do
      user = create(:user, phone: "+1(500)-400. ,3000")

      expect(user.phone).to eq("+15004003000")
    end
  end
end
