require 'rails_helper'

describe Rating do

  let(:user1) {FactoryGirl.create :user}
  let(:user2) {FactoryGirl.create :user}
  let(:rating) {Rating.create(value: 0, rater_id: 1, ratee_id: 2)}


  it "should create an instance of Rating" do
    expect(rating).to be_instance_of(Rating)
  end

  it "should belong to trait" do
    expect(rating).to respond_to :trait
  end

  it "should belong to a rater" do
    expect(rating).to respond_to :rater
  end

  it "should belong to a ratee" do
    expect(rating).to respond_to :ratee
  end

  it "is invalid without a value" do
    bad_rating = Rating.create(value: nil, rater_id: 1, ratee_id: 2)
    expect(bad_rating.valid?).to eq(false)
  end

  it "is invalid without a rating user" do
    bad_rating = Rating.create(value: 0, rater_id: nil, ratee_id: 2)
    expect(bad_rating.valid?).to eq(false)
  end

  it "is invalid without a rated user" do
    bad_rating = Rating.create(value: 0, rater_id: 1, ratee_id: nil)
    expect(bad_rating.valid?).to eq(false)
  end


end
