require 'rails_helper'

describe User do
  let(:user) {FactoryGirl.create :user}

  it "should create an instance of a user" do
    expect(user).to be_instance_of(User)
  end

  context "validations" do
    it {should_not allow_value('bademailformat').for(:email)}
  end

end
