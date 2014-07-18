require 'spec_helper'
require 'rails_helper'

describe User do
  let(:user) {FactoryGirl.create :user}

  it "should create an instance of a user" do
    expect(user).to be_instance_of(User)
  end
end
