require 'rails_helper'

RSpec.describe Blog, type: :model do
  context "validation" do
    it "is valid" do
      blog = FactoryBot.build(:blog)
      expect(blog).to be_valid
    end

    it "is not valid - name is null" do
      blog = FactoryBot.build(:blog,
                              {name: nil})
      expect(blog).to_not be_valid
    end

    it "is not valid - error message for null in name" do
      blog = FactoryBot.build(:blog,
                              {name: nil})
      blog.valid?
      expect(blog.errors[:name]).to include("can't be blank")
    end
 end
end
