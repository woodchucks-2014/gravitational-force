require 'spec_helper'
require 'rails_helper'

describe AttributesController do
  it "assigns all attributes in index" do
    get :index
    expect(assigns(:attributes)).to eq Attribute.all
  end
end