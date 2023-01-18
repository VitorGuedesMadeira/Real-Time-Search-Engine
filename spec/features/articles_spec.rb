require 'rails_helper'

RSpec.feature 'Articles', type: :feature do
  before :each do
    @user = User.create(name: 'Vitor', email: 'vgm@hotmail.com', password: 123321)
    sign_in @user
    visit articles_path
  end

  describe 'root page' do
    it 'when the user logs in, they are presented with the articles page' do
      expect(page).to have_content('Articles')
    end

    it 'there is a search button that the user can click' do
      expect(current_path).to eq(articles_path)
    end
  end
end