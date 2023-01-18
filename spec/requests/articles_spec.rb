require 'rails_helper'

RSpec.describe "/articles", type: :request do
  before :each do
    @user = User.create(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
    sign_in @user
  end

  let(:valid_attributes) do
    {
      title: 'Test title',
      description: 'Test description Test description Test description Test description Test description Test description Test description Test description Test description Test description Test description Test description',
      author: 'Test author'
    }
  end

  let(:invalid_attributes) do
    {
      title: nil,
      content: nil,
      author: nil
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      Article.create! valid_attributes
      get articles_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      article = Article.create! valid_attributes
      get article_url(article)
      expect(response).to be_successful
    end
  end
end
