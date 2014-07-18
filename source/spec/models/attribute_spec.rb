require 'rails_helper'

describe Attribute do
  it "should have a name" do
    attribute = FactoryGirl.build :attribute
    expect(attribute.name).to eq("Attribute_name")
  end
end
