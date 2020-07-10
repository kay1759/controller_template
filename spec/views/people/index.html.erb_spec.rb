require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
             FactoryBot.create(:people),
             FactoryBot.create(:people)
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", text: "John_1 Smith", count: 1
    assert_select "tr>td", text: "John_2 Smith", count: 1
    assert_select "tr>td", text: "user_1@example.com", count: 1
    assert_select "tr>td", text: "user_2@example.com", count: 1
    assert_select "tr>td", text: 30.to_s, count: 2
  end
end
