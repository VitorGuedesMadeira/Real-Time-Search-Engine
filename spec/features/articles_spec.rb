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

    it 'when the user logs in, they are presented with the articles page' do
      expect(page).to have_content('Analytics')
    end

    it 'Header contains the word Welcome' do
      expect(page).to have_content('Welcome')
    end

    it 'Header contains the word Log out' do
      expect(page).to have_content('Log out')
    end

    it 'Footer contains the name Vitor G. M.' do
      expect(page).to have_content('Vitor G. M. ')
    end

    it 'when the user logs in, they are presented with the articles page' do
      expect(page).to have_content('Articles')
    end

    it 'The current path is going to be the root (articles path)' do
      expect(current_path).to eq(articles_path)
    end
  end
end