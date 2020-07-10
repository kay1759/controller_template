require 'rails_helper'

RSpec.describe "blogs/index", type: :view do
  before(:each) do
    assign(:blogs, [
             FactoryBot.create(:blogs),
             FactoryBot.create(:blogs)
    ])
  end

  it "renders a list of blogs" do
    render
    assert_select "tr>td", text: "blog_name_1", count: 1
    assert_select "tr>td", text: "blog_name_2", count: 1
    assert_select "tr>td", text: "Blog Title 1", count: 1
    assert_select "tr>td", text: "Blog Title 2", count: 1
    assert_select "tr>td", text: "Blog Content", count: 2
  end
end
