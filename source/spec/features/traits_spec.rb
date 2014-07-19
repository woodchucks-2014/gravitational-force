require 'spec_helper'
require 'rails_helper'

feature 'ability to view traits' do

  scenario 'when user visits index' do
    user = FactoryGirl.create :user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
    t = FactoryGirl.create :trait
    visit user_traits_path(User.first)
    expect(page).to have_content t.name.capitalize
  end

  scenario 'when user rates a trait' do
    user = FactoryGirl.create :user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
    trait = FactoryGirl.create :trait
    visit user_traits_path(user)
    find(:xpath, "//input[@id='#{trait.name}_rating']").set 57
    check('something')
    click_button('Update Trait')
    expect(Rating.all).to change(Rating, :count).by 1
  end

end
