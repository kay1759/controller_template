require 'rails_helper'

RSpec.describe "blog_posts/show", type: :view do
  before(:each) do
    @blog = assign(:blog, FactoryBot.create(:blog))
    @resource = assign(:blog_post, FactoryBot.create(:blog_post))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match("#{@blog.id}")
    expect(rendered).to match("controller_template")
    expect(rendered).to match("Rails Controller Templete")
    expect(rendered).to match("Experiment about Rails Controller Template")
  end
end
