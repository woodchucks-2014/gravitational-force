require 'rails_helper'

feature 'ability to view ratings' do

  scenario 'when user visits index, trait name appears on form' do
    user = FactoryGirl.create :user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
    t = FactoryGirl.create :trait
    visit user_ratings_path(User.first)
    expect(page).to have_content t.name.capitalize
  end

  scenario 'when user rates a trait, a new rating is created' do
    user = FactoryGirl.create :user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
    trait = FactoryGirl.create :trait
    visit user_ratings_path(user)
    find(:xpath, "//input[@id='#{trait.name}_rating']").set 57
    check('something')
    click_button('Update User')
    expect{Rating.all}.to change(Rating, :count).by 1
  end

end
