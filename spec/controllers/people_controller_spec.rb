require 'rails_helper'

RSpec.describe PeopleController, type: :controller do


  let(:person) { FactoryBot.create(:person) }

  let(:valid_attributes) {
    {name: "John Smith",
     email: "user@example.com",
     age: 30
    }
  }

  let(:invalid_attributes) {
    {name: nil,
     email: "user@example.com",
     age: 30
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
      get :show, params: {'id' => person.id}
      expect(response).to  be_successful
    end

    it "return a 200 response" do
      get :show, params: {'id' => person.id}
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
               person: valid_attributes
             }
      end

      it "add a new person" do
        expect {
          post :create, params: {
                 person: valid_attributes
               }
        }.to change(Person, :count).by(1)
      end

      it "return a 302 response" do
        expect(response).to have_http_status "302"
      end

      it "redirect to the page" do
        expect(response).to redirect_to "/people/1"
      end
    end

    context "invalid params" do
      it "do not add a new person" do
        expect{
          post :create, params: {
                 person: invalid_attributes
               }
        }.to change(Person, :count).by(0)
      end
    end
  end

  context "#edit" do
    it "responds successfully" do
      get :edit, params: {'id' => person.id}
      expect(response).to be_successful
    end

    it "return a 200 response" do
      get :edit, params: {'id' => person.id}
      expect(response).to have_http_status("200")
    end
  end

  context "#update" do
    context "valid params" do
      before :each do
        put :update, params: {
              id: person.id,
              person: {
                age: 31
              }
            }
      end

      it "update a person" do
        expect(person.reload.age).to eq 31
      end

      it "return a 302 response" do
        expect(response).to have_http_status "302"
      end

      it "redirect to the page" do
        expect(response).to redirect_to "/people/#{person.id}"
      end
    end

    context "invalid params" do
      before :each do
        put :update, params: {
              id: person.id,
              person: {
                name: nil,
                age: 31
              }
            }
      end

      it "do not update a person" do
        expect(person.reload.age).to eq 30
      end
    end
  end

  context "#destory" do
    context "existing person" do
      before :each do
        @person = FactoryBot.create(:person)
      end

      it "delete a person" do
        expect {
          delete :destroy, params: {
                 id: @person.id
               }
        }.to change(Person, :count).by(-1)
      end

      it "redirect to the page" do
        delete :destroy, params: {
                 id: @person.id
               }
        expect(response).to redirect_to "/people"
      end
    end
  end
end
