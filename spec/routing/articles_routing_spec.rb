require "rails_helper"

RSpec.describe ArticlesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/articles").to route_to("articles#index")
    end

    it "routes to #show" do
      expect(get: "/articles/1").to route_to("articles#show", id: "1")
    end
  end
end
