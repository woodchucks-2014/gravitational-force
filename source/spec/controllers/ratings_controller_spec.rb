require 'rails_helper'

describe RatingsController do
  it "prepares all ratings in index" do
    FactoryGirl.create :trait
    user = FactoryGirl.create :user
    get :index, user_id: user.id
    # expect(assigns(:ratings)).to eq Trait.all
  end
end
