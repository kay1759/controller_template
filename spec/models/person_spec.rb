require 'rails_helper'

RSpec.describe Person, type: :model do
  context "validation" do
    it "is valid" do
      person = FactoryBot.build(:person)
      expect(person).to be_valid
    end

    it "is not valid - name is null" do
      person = FactoryBot.build(:person,
                                {name: nil})
      expect(person).to_not be_valid
    end

    it "is not valid - error message for null in name" do
      person = FactoryBot.build(:person,
                              {name: nil})
      person.valid?
      expect(person.errors[:name]).to include("can't be blank")
    end
  end
end
