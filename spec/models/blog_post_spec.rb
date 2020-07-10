require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  context "validation" do
    it "is valid" do
      blog_post = FactoryBot.build(:blog_post)
      expect(blog_post).to be_valid
    end

    it "is not valid - name is null" do
      blog_post = FactoryBot.build(:blog_post,
                                   {name: nil})
      expect(blog_post).to_not be_valid
    end

    it "is not valid - blog_id is null" do
      blog_post = FactoryBot.build(:blog_post,
                                   {blog_id: nil})
      expect(blog_post).to_not be_valid
    end

    it "is not valid - blog object not exists" do
      blog_post = FactoryBot.build(:blog_post,
                                   {blog_id: 100})
      expect(blog_post).to_not be_valid
    end

    it "is not valid - error message for null in name" do
      blog_post = FactoryBot.build(:blog_post,
                                   {name: nil})
      blog_post.valid?
      expect(blog_post.errors[:name]).to include("can't be blank")
    end

    it "is not valid - error message for unexisted blog (nil)" do
      blog_post = FactoryBot.build(:blog_post,
                                   {blog_id: nil})
       blog_post.valid?
       expect(blog_post.errors[:blog]).to include("must exist")
    end

    it "is not valid - error message for unexisted blog" do
      blog_post = FactoryBot.build(:blog_post,
                                   {blog_id: 100})
      blog_post.valid?
      expect(blog_post.errors[:blog]).to include("must exist")
    end
  end
end
