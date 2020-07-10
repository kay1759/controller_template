require 'rails_helper'

RSpec.describe "blogs/edit", type: :view do
  before(:each) do
    @resource = assign(:blog, FactoryBot.create(:blog))
  end

  it "renders the edit blog form" do
    render

    assert_select "form[action=?][method=?]", blog_path(@resource), "post" do

      assert_select "input[name=?]", "blog[name]"

      assert_select "input[name=?]", "blog[title]"

      assert_select "textarea[name=?]", "blog[content]"
    end
  end
end
