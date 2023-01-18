require 'rails_helper'

RSpec.feature 'Analytics', type: :feature do
  before :each do
    @user = User.create(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
    sign_in @user
    visit analytics_path
  end

  describe 'analytics page' do
    it 'the user can see the analytics page' do
      expect(page).to have_content('Top searches')
    end
  end
end