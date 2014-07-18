require 'rails_helper'

describe Trait do
  let(:trait) {FactoryGirl.build :trait}

  it "should create an instance of trait" do
    expect(trait).to be_instance_of(Trait)
  end

end
