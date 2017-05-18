require 'rails_helper'

describe 'When a user visits `/users/new`' do
  describe 'and they enter all required params' do
    it 'they can create a new account' do
      visit '/users/new'

      fill_in 'user[email]', with: 'user@user.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      fill_in 'user[phone]', with: '500-400-3000'
      click_on 'Subscribe'

      expect(page).to have_content('Success!')
      expect(page).to have_content('user@user.com')
      expect(page).to have_content('5004003000')
      expect(User.count).to eq(1)
      expect(User.last.active).to eq(false)
    end
  end

  describe 'and they enter mismatched password and password confirmation' do
    it 'they see an appropriate error' do
      visit '/users/new'

      fill_in 'user[email]', with: 'user@user.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'pass'
      fill_in 'user[phone]', with: '500-400-3000'
      click_on 'Subscribe'

      expect(current_path).to eq('/users')
      expect(page).to have_content('Password confirmation doesn\'t match Password')
      expect(User.count).to eq(0)
    end
  end

  describe 'and they fail to enter an email' do
    it 'they see an appropriate error' do
      visit '/users/new'

      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      fill_in 'user[phone]', with: '500-400-3000'
      click_on 'Subscribe'

      expect(current_path).to eq('/users')
      expect(page).to have_content('Email can\'t be blank')
      expect(User.count).to eq(0)
    end
  end

  describe 'and they fail to enter their phone number' do
    it 'they see an appropriate error' do
      visit '/users/new'

      fill_in 'user[email]', with: 'email@email.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_on 'Subscribe'

      expect(current_path).to eq('/users')
      expect(page).to have_content('Phone can\'t be blank')
      expect(User.count).to eq(0)
    end
  end

  describe 'and they fail to enter multiple attributes' do
    it 'they see an appropriate error' do
      visit '/users/new'

      fill_in 'user[password]', with: 'password'
      click_on 'Subscribe'

      expect(current_path).to eq('/users')
      expect(page).to have_content('Email can\'t be blank')
      expect(page).to have_content('Phone can\'t be blank')
      expect(page).to have_content('Password confirmation doesn\'t match Password')
      expect(User.count).to eq(0)
    end
  end
end
