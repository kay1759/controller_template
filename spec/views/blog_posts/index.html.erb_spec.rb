require 'rails_helper'

RSpec.describe "blog_posts/index", type: :view do
  before(:each) do
    @blog = assign(:blog, FactoryBot.create(:blog))
    assign(:blog_posts, [
             FactoryBot.create(:blog_posts),
             FactoryBot.create(:blog_posts)
    ])
  end

  it "renders a list of blog_posts" do
    render
    assert_select "tr>td", text: "blog_post_name_1", count: 1
    assert_select "tr>td", text: "blog_post_name_2", count: 1
    assert_select "tr>td", text: "Blog Post Title 1", count: 1
    assert_select "tr>td", text: "Blog Post Title 2", count: 1
    assert_select "tr>td", text: "Blog Post Content", count: 2
  end
end
