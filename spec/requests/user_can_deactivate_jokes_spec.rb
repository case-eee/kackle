require 'rails_helper'

describe 'POST /sms' do
  describe 'with a body of `unsubscribe`' do
    it 'a user is deactivated' do
      user = create(:user)

      post '/sms', params: {'Body': 'unsubscribe', 'From': '+15004003000'}

      user.reload
      expect(user.active).to eq(false)
    end
  end

  describe 'with a body of `no`' do
    it 'a user is deactivated' do
      user = create(:user)

      post '/sms', params: {'Body': 'no', 'From': '+15004003000'}

      user.reload
      expect(user.active).to eq(false)
    end
  end

  describe 'with a body of `uNsUbSCribE`' do
    it 'a user is deactivated' do
      user = create(:user)

      post '/sms', params: {'Body': 'uNsUbSCribE', 'From': '+15004003000'}

      user.reload
      expect(user.active).to eq(false)
    end
  end


  describe 'with a body of `nO`' do
    it 'a user is deactivated' do
      user = create(:user)

      post '/sms', params: {'Body': 'nO', 'From': '+15004003000'}

      user.reload
      expect(user.active).to eq(false)
    end
  end
end

