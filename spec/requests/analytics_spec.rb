require 'rails_helper'

RSpec.describe 'Analytics', type: :request do
  before :each do
    @user = User.create(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get analytics_url
      expect(response).to have_http_status(:success)
    end
  end
end