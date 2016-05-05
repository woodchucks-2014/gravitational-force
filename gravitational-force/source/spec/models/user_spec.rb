require 'rails_helper'

describe User do
  let(:ben) {FactoryGirl.create :user}
  let(:greg) {FactoryGirl.create :user}
  let(:drew) {FactoryGirl.create :user}

  let(:sports) {FactoryGirl.create :trait}
  let(:programming) {FactoryGirl.create :trait}

  let(:rating_1) {Rating.create(value: 10,
                  rater_id: ben.id,
                  ratee_id: greg.id,
                  trait_id: sports.id)}
  let(:rating_2) {Rating.create(value: 20,
                  rater_id: drew.id,
                  ratee_id: greg.id,
                  trait_id: sports.id)}
  let(:rating_3) {Rating.create(value: 30,
                  rater_id: greg.id,
                  ratee_id: greg.id,
                  trait_id: sports.id)}
  let(:rating_4) {Rating.create(value: 10,
                  rater_id: ben.id,
                  ratee_id: greg.id,
                  trait_id: programming.id)}
  let(:rating_5) {Rating.create(value: 20,
                  rater_id: drew.id,
                  ratee_id: greg.id,
                  trait_id: programming.id)}
  let(:rating_6) {Rating.create(value: 30,
                  rater_id: greg.id,
                  ratee_id: greg.id,
                  trait_id: programming.id)}

  let(:rating_7) {Rating.create(value: 1,
                  rater_id: ben.id,
                  ratee_id: ben.id,
                  trait_id: sports.id)}
  let(:rating_8) {Rating.create(value: 20,
                  rater_id: drew.id,
                  ratee_id: ben.id,
                  trait_id: sports.id)}
  let(:rating_9) {Rating.create(value: 30,
                  rater_id: greg.id,
                  ratee_id: ben.id,
                  trait_id: sports.id)}
  let(:rating_10) {Rating.create(value: 1,
                  rater_id: ben.id,
                  ratee_id: ben.id,
                  trait_id: programming.id)}
  let(:rating_11) {Rating.create(value: 20,
                  rater_id: drew.id,
                  ratee_id: ben.id,
                  trait_id: programming.id)}
  let(:rating_12) {Rating.create(value: 30,
                  rater_id: greg.id,
                  ratee_id: ben.id,
                  trait_id: programming.id)}

  before(:each) do
    greg.received_ratings << [rating_1, rating_2, rating_3,
                              rating_4, rating_5, rating_6]

    ben.received_ratings << [rating_7, rating_8, rating_9,
                            rating_10, rating_11, rating_12]

    #talk to rebecca about why factory girl does not create
    #item in database / association
  end

  it "should create an instance of a user" do
    expect(ben).to be_instance_of(User)
  end

  it "should have rating" do
    expect(greg.received_ratings.size).to eq(6)
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
      expect(ben.user_score(sports)).to eq(25)
    end
  end

  context "#self_score" do

    it "should return the score a user gave him/herself for a given trait" do
      expect(greg.self_score(sports)).to eq(30)
      expect(ben.self_score(sports)).to eq(1)
    end

  end

  context "#delta" do

    it "should return the difference between #user_score and #self_score" do
      expect(greg.delta(sports)).to eq(-15)
      expect(ben.delta(sports)).to eq(24)
    end

  end

  context "#point_distance" do

    it "should measure the distance between two points" do
      expect(greg.point_distance(sports, programming)).to eq(21)
      expect(ben.point_distance(sports, programming)).to eq(33)
    end

  end

  # context ".perception" do

  #   it "should return the user with largest distance where perception is greater than self rating" do
  #     expect(self.perception(sports, programming).size).to eq(1)
  #   end

  # end

  # context ".individual" do

  #   it "should return the user with largest distance where individual is greater than perception rating" do
  #     expect(User.individual(programming,sports).id).to eq(greg.id)
  #   end

  # end

  # context ".accurate" do

  #   it "should return the user who has the smallest distance between self and perception" do
  #     expect(User.accurate(programming,sports).id).to eq(greg.id)
  #   end

  # end

  # context ".deluded" do

  #   it "should return the user who has the largest distance between self and perception" do
  #     expect(User.deluded(programming,sports).id).to eq(ben.id)
  #   end

  # end

end
