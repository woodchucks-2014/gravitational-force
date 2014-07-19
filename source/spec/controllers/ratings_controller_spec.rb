require 'rails_helper'

describe RatingsController do
  it "prepares existing rating in index" do
    rating = FactoryGirl.create :rating
    trait = FactoryGirl.create :trait
    user = FactoryGirl.create :user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    get :index, user_id: user.id
    expect(assigns(:ratings).first).to eq(rating)
  end

  # it "prepares new ratings in index" do
  #   pending
  # end
end
