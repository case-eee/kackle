require 'rails_helper'

feature 'Deactivating Daily Texts' do
  context 'As an authenticated user' do
    scenario 'I can successfully deactivate my daily text messages' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)
      click_on "Unsubscribe"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Successfully updated.")
      expect(user.active).to eq(false)
    end

    scenario 'I cannot deactivate another users daily text messages' do
      user1, user2 = create_list(:user, 2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      visit user_path(user2)
      click_on "Unsubscribe"

      expect(current_path).to eq(user_path(user1))
      expect(page).to have_content("Successfully updated.")
      expect(user1.active).to eq(false)
      expect(user2.active).to eq(true)
    end
  end

  context 'As an unauthenticated user' do
    scenario 'I cannot see a user show page' do
      user = create(:user)

      visit user_path(user)

      expect(page).to have_content("Welcome to Kackle!")
    end
  end
end
