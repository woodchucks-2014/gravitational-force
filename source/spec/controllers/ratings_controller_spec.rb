require 'rails_helper'

describe RatingsController do
  it "prepares all ratings in index" do
    FactoryGirl.create :trait
    get :index
    expect(assigns(:ratings)).to eq Trait.all
  end
end
