require 'rails_helper'

describe Rating do
  let(:rating) {Rating.create(value: 0)}

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

end
