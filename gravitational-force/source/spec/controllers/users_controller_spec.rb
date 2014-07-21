require 'rails_helper'

describe UsersController do

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new user in the database" do
        expect{
          post :create, user: attributes_for(:user)
          }.to change(User, :count).by(1)
      end
    end
  end

end
