require 'rails_helper'

describe Rating do

  let(:user1) {FactoryGirl.create :user}
  let(:user2) {FactoryGirl.create :user}
  let(:rating) {Rating.create(value: 0, rating_user_id: user1, rated_user_id: user2)}
  let(:bad_rating) {Rating.create}


  it "should create an instance of Rating" do
    expect(rating).to be_instance_of(Rating)
  end

  it "should belong to trait" do
    expect(rating).to respond_to :trait
  end

  it "should belong to a rated user" do
    expect(rating).to respond_to :rated_user
  end

  it "should belong to a rating user" do
    expect(rating).to respond_to :rating_user
  end

  it "is invalid without a value" do
    #expect(bad_rating.save).to eq(false)
    expect(bad_rating.errors[:value].size).to eq(1)
  end

  it "is invalid without a rating user" do
    expect(bad_rating.errors[:rating_user_id].size).to eq(1)
  end

  it "is invalid without a rated user" do
    expect(bad_rating.errors[:rated_user_id].size).to eq(1)
  end


end
