require 'rails_helper'

RSpec.describe BlogPostsController, type: :controller do

  let(:blog) { FactoryBot.create(:blog) }
  let(:blog_post) { FactoryBot.create(:blog_post) }

  let(:valid_attributes) {
    {blog_id: blog.id,
     name: "it",
     title: "Information Technology",
     content: "Blog about Information Techonology"
    }
  }

  let(:invalid_attributes) {
    {blog_id:  blog.id,
     name: nil,
     title: "Information Technology",
     content: "Blog about Information Techonology"
    }
  }

  context "#index" do
    it "responds successfully" do
      get :index
      expect(response).to  be_successful
    end

    it "return a 200 response" do
      get :index
      expect(response).to have_http_status("200")
    end
  end

  context "#show" do
    it "responds successfully" do
      get :show, params: {'id' => blog_post.id}
      expect(response).to  be_successful
    end

    it "return a 200 response" do
      get :show, params: {'id' => blog_post.id}
      expect(response).to have_http_status("200")
    end
  end

  context "#new" do
    it "responds successfully" do
      get :new
      expect(response).to be_successful
    end

    it "return a 200 response" do
      get :new
      expect(response).to have_http_status("200")
    end
  end

  context "#create" do
    context "valid params" do
      before :each do
        post :create, params: {
               blog_post: valid_attributes
             }
      end

      it "add a new blog_post" do
        expect {
          post :create, params: {
                 blog_post: valid_attributes
               }
        }.to change(BlogPost, :count).by(1)
      end

      it "return a 302 response" do
        expect(response).to have_http_status "302"
      end

      it "redirect to the page" do
        expect(response).to redirect_to "/blog_posts/1"
      end
    end

    context "invalid params" do
      it "do not add a new blog_post" do
        expect{
          post :create, params: {
                 blog_post: invalid_attributes
               }
        }.to change(BlogPost, :count).by(0)
      end
    end
  end

  context "#edit" do
    it "responds successfully" do
      get :edit, params: {'id' => blog_post.id}
      expect(response).to be_successful
    end

    it "return a 200 response" do
      get :edit, params: {'id' => blog_post.id}
      expect(response).to have_http_status("200")
    end
  end

  context "#update" do
    context "valid params" do
      before :each do
        put :update, params: {
              id: blog_post.id,
              blog_post: {
                content: "Rails Controller Way"
              }
            }
      end

      it "update a blog_post" do
        expect(blog_post.reload.content).to eq "Rails Controller Way"
      end

      it "return a 302 response" do
        expect(response).to have_http_status "302"
      end

      it "redirect to the page" do
        expect(response).to redirect_to "/blog_posts/#{blog_post.id}"
      end
    end

    context "invalid params" do
      before :each do
        put :update, params: {
              id: blog_post.id,
              blog_post: {
                name: nil,
                content: "Rails Controller Way"
              }
            }
      end

      it "do not update a blog_post" do
        expect(blog_post.reload.content).to eq "Experiment about Rails Controller Template"
      end
    end
  end

  context "#destory" do
    context "existing blog_post" do
      before :each do
        @blog_post = FactoryBot.create(:blog_post)
      end

      it "delete a blog_post" do
        expect {
          delete :destroy, params: {
                 id: @blog_post.id
               }
        }.to change(BlogPost, :count).by(-1)
      end

      it "redirect to the page" do
        delete :destroy, params: {
                 id: @blog_post.id
               }
        expect(response).to redirect_to "/blog_posts"
      end
    end
  end
end
