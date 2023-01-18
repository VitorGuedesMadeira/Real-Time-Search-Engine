require 'rails_helper'

RSpec.feature 'Analytics', type: :feature do
  before :each do
    @user = User.create(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
  end
  
  describe 'analytics page' do
    it 'the user can see the analytics page' do
      sign_in @user
      visit analytics_path
      expect(page).to have_content('Top searches')
    end

    it 'should redirect to the sign in page when user not logged-in' do
      visit analytics_path
      expect(current_path).to eq(new_user_session_path)
    end

    it 'should have the title Top searches when the user visits the page' do
      sign_in @user
      visit analytics_path
      expect(page).to have_content('Top searches')
    end
  end
end