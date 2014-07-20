require 'rails_helper'

describe User do
  let(:ben) {FactoryGirl.create :user}
  let(:greg) {FactoryGirl.create :user}
  let(:drew) {FactoryGirl.create :user}

  let(:sports) {FactoryGirl.create :trait}
  let(:rating_1) {Rating.create(value: 10,
                  rating_user_id: ben.id,
                  rated_user_id: greg.id,
                  trait_id: sports.id)}
  let(:rating_2) {Rating.create(value: 20,
                  rating_user_id: drew.id,
                  rated_user_id: greg.id,
                  trait_id: sports.id)}
  let(:rating_3) {Rating.create(value: 30,
                  rating_user_id: greg.id,
                  rated_user_id: greg.id,
                  trait_id: sports.id)}

  before(:each) do
    greg.user_ratings << [rating_1, rating_2, rating_3]
    #talk to rebecca about why factory girl does not create
    #item in database / association
  end

  it "should create an instance of a user" do
    expect(ben).to be_instance_of(User)
  end

  it "should have rating" do
    expect(greg.user_ratings.size).to eq(3)
  end

   it "should create an instance of a rating" do
    expect(rating_1).to be_instance_of(Rating)
  end

    it "should create an instance of a trait" do
    expect(sports).to be_instance_of(Trait)
  end

  context "validations" do
    it {should_not allow_value('bademailformat').for(:email)}
  end

  context "#user_score" do

    it "should return the average rating a user received excluding his/her own rating" do
      expect(greg.user_score(sports)).to eq(15)
    end
  end

  context "#self_score" do

    it "should return the score a user gave him/herself for a given trait" do
      expect(greg.self_score(sports)).to eq(30)
    end

  end

  context "#delta" do

    it "should return the difference between #user_score and #self_score" do
      expect(greg.delta(sports)).to eq(-15)
    end

  end

  context "#point_distance" do

    it "should measure the distance between two points" do
      pending
    end

  end

  context ".perception" do

    it "should return the user with largest distance where perception is greater than self rating" do
      pending
    end

  end

  context ".individual" do

    it "should return the user with largest distance where individual is greater than perception rating" do
      pending
    end

  end

  context ".accurate" do

    it "should return the user who has the smallest distance between self and perception" do
      pending
    end

  end

  context ".deluded" do

    it "should return the user who has the largest distance between self and perception" do
      pending
    end

  end

end
