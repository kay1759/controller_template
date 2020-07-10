require 'rails_helper'

RSpec.describe BlogsController, type: :controller do


  let(:blog) { FactoryBot.create(:blog) }

  let(:valid_attributes) {
    {name: "it",
     title: "Information Technology",
     content: "Blog about Information Techonology"
    }
  }

  let(:invalid_attributes) {
    {name: nil,
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
      get :show, params: {'id' => blog.id}
      expect(response).to  be_successful
    end

    it "return a 200 response" do
      get :show, params: {'id' => blog.id}
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
               blog: valid_attributes
             }
      end

      it "add a new blog" do
        expect {
          post :create, params: {
                 blog: valid_attributes
               }
        }.to change(Blog, :count).by(1)
      end

      it "return a 302 response" do
        expect(response).to have_http_status "302"
      end

      it "redirect to the page" do
        expect(response).to redirect_to "/blogs/1"
      end
    end

    context "invalid params" do
      it "do not add a new blog" do
        expect{
          post :create, params: {
                 blog: invalid_attributes
               }
        }.to change(Blog, :count).by(0)
      end
    end
  end

  context "#edit" do
    it "responds successfully" do
      get :edit, params: {'id' => blog.id}
      expect(response).to be_successful
    end

    it "return a 200 response" do
      get :edit, params: {'id' => blog.id}
      expect(response).to have_http_status("200")
    end
  end

  context "#update" do
    context "valid params" do
      before :each do
        put :update, params: {
              id: blog.id,
              blog: {
                content: "Blog about Music and Sports"
              }
            }
      end

      it "update a blog" do
        expect(blog.reload.content).to eq "Blog about Music and Sports"
      end

      it "return a 302 response" do
        expect(response).to have_http_status "302"
      end

      it "redirect to the page" do
        expect(response).to redirect_to "/blogs/#{blog.id}"
      end
    end

    context "invalid params" do
      before :each do
        put :update, params: {
              id: blog.id,
              blog: {
                name: nil,
                content: "Blog about Music and Sports"
              }
            }
      end

      it "do not update a blog" do
        expect(blog.reload.content).to eq "Blog about Information Technology"
      end
    end
  end

  context "#destory" do
    context "existing blog" do
      before :each do
        @blog = FactoryBot.create(:blog)
      end

      it "delete a blog" do
        expect {
          delete :destroy, params: {
                 id: @blog.id
               }
        }.to change(Blog, :count).by(-1)
      end

      it "redirect to the page" do
        delete :destroy, params: {
                 id: @blog.id
               }
        expect(response).to redirect_to "/blogs"
      end
    end
  end
end
