require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = FactoryBot.create(:person)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match("John Smith")
    expect(rendered).to match("user@example.com")
    expect(rendered).to match("30")
  end
end
