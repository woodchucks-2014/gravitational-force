require 'rails_helper'

describe Rating do
  let(:rating) {Rating.create(value: 0)}

  it "should create an instance of Rating" do
    expect(rating).to be_instance_of(Rating)
  end

end
