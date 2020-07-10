require 'rails_helper'

RSpec.describe "blogs/show", type: :view do
  before(:each) do
    @resource = FactoryBot.create(:blog)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match("it")
    expect(rendered).to match("Information Technology")
    expect(rendered).to match("Blog about Information Technology")
  end
end
