require 'spec_helper'
require 'rails_helper'

describe GravitatesController do
  it "assigns all users in index" do
    FactoryGirl.create :user
    get :index
    expect(assigns(:users)).to eq User.all
  end

  it "assings all traits in index" do
    FactoryGirl.create :trait
    get :index
    expect(assigns(:traits)).to eq Trait.all
  end

end
