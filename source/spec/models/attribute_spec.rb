require 'rails_helper'

describe Attribute do
  let(:attribute) {FactoryGirl.build :attribute}

  it "should create an instance of Attribute" do
    expect(attribute).to be_instance_of(Attribute)
  end

end
