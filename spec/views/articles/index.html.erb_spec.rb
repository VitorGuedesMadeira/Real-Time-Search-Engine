require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        title: "Title",
        description: "Description",
        author: "Author"
      ),
      Article.create!(
        title: "Title",
        description: "Description",
        author: "Author"
      )
    ])
  end

  it "renders a list of articles" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Author".to_s), count: 2
  end
end
