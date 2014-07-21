require 'rails_helper'



describe RatingsController do
  it "prepares a new rating in index" do
    trait = Trait.new(name: "sports")
    trait.save
    user = User.new(name: "Ben", email: "ben@ben.com", password: "test", password_confirmation: "test")
    user.save
    rating = Rating.new(ratee_id: 1, rater_id: 1, trait_id: 1, value: 2)
    rating.save
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    get :index, user_id: user.id
    expect(Rating.first).to eq(rating)
  end

  it "creates a new instance of rating" do
    trait = Trait.new(name: "sports")
    trait.save
    user = User.new(name: "Ben", email: "ben@ben.com", password: "test", password_confirmation: "test")
    user.save
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    expect{post :create, user_id: user.id, save_sports: 1, sports: { value: 50 }}.to change(Rating, :count).by(1)
  end
end

