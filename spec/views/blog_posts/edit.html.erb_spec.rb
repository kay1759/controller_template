require 'rails_helper'

RSpec.describe "blog_posts/edit", type: :view do
  before(:each) do
    @resource = assign(:blog_post, FactoryBot.create(:blog_post))
  end

  it "renders the edit blog_post form" do
    render

    assert_select "form[action=?][method=?]", blog_post_path(@resource), "post" do

      assert_select "input[name=?]", "blog_post[blog_id]"

      assert_select "input[name=?]", "blog_post[name]"

      assert_select "input[name=?]", "blog_post[title]"

      assert_select "textarea[name=?]", "blog_post[content]"
    end
  end
end
