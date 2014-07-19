require 'spec_helper'
require 'rails_helper'

describe TraitsController do
  it "assigns all traits in index" do
    FactoryGirl.create :trait
    get :index
    expect(assigns(:traits)).to eq Trait.all
  end
end
