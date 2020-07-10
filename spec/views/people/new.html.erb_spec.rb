require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, FactoryBot.build(:person))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input[name=?]", "person[name]"

      assert_select "input[name=?]", "person[email]"

      assert_select "input[name=?]", "person[age]"
    end
  end
end
