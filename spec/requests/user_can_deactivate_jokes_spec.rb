require 'rails_helper'

describe 'POST /messaging/twilio/users' do
  describe 'with a body of `unsubscribe`' do
    it 'a user is deactivated' do
      user = create(:user)

      post '/messaging/twilio/users', params: {'Body': 'unsubscribe', 'From': '+15004003000'}

      user.reload
      expect(user.active).to eq(false)
    end
  end

  describe 'with a body of `no`' do
    it 'a user is deactivated' do
      user = create(:user)

      post '/messaging/twilio/users', params: {'Body': 'no', 'From': '+15004003000'}

      user.reload
      expect(user.active).to eq(false)
    end
  end

  describe 'with a body of `uNsUbSCribE`' do
    it 'a user is deactivated' do
      user = create(:user)

      post '/messaging/twilio/users', params: {'Body': 'uNsUbSCribE', 'From': '+15004003000'}

      user.reload
      expect(user.active).to eq(false)
    end
  end


  describe 'with a body of `nO`' do
    it 'a user is deactivated' do
      user = create(:user)

      post '/messaging/twilio/users', params: {'Body': 'nO', 'From': '+15004003000'}

      user.reload
      expect(user.active).to eq(false)
    end
  end

  describe 'with a body of `yes`' do
    it 'a user is activated' do
      user =  create(:user, active: false)

      post '/messaging/twilio/users', params: {'Body': 'yes', 'From': '+15004003000'}

      user.reload
      expect(user.active).to eq(true)
    end
  end

  describe 'with a body of `yEs`' do
    it 'a user is activated' do
      user =  create(:user, active: false)

      post '/messaging/twilio/users', params: {'Body': 'yEs', 'From': '+15004003000'}

      user.reload
      expect(user.active).to eq(true)
    end
  end
end
