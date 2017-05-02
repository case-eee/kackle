require 'rails_helper'

feature 'Activating Daily Texts' do
  context 'As an authenticated user' do
    scenario 'I can successfully activate my daily text messages' do
      user = create(:user, active: false)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)
      click_on "Subscribe"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Successfully updated.")
      expect(user.active).to eq(true)
    end
  end
end
