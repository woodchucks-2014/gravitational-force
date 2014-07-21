require 'rails_helper'

describe RatingsController do
  it "prepares existing rating in index" do
    trait = FactoryGirl.create :trait
    user = FactoryGirl.create :user
    rating = FactoryGirl.create :rating
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    get :index, user_id: user.id
    p "*"*50
    p rating
    expect(assigns(:ratings)).to eq([rating])
  end

  # it "prepares new ratings in index" do
  #   pending
  # end
end
