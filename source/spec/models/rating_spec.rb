require 'rails_helper'

describe Rating do
  let(:user1) {FactoryGirl.create :user}
  let(:user2) {FactoryGirl.create :user}
  let(:rating) {Rating.create(value: 0, rating_user_id: user1, rated_user_id: user2)}

  it "should create an instance of Rating" do
    expect(rating).to be_instance_of(Rating)
  end

end
