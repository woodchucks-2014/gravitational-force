require 'spec_helper'
require 'rails_helper'

feature 'ability to view traits' do

  scenario 'when user visits index' do
    t = FactoryGirl.create :trait
    visit traits_path
    expect(page).to have_content t.name
  end

  scenario 'when user rates a trait' do
    user = FactoryGirl.create :user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
    trait = FactoryGirl.create :trait
    visit traits_path
    find(:xpath, "//input[@id='#{trait.name}_rating']").set 57
    check('set_trait')
    click_button('submit')
    expect(Rating.all).to change(Rating, :count).by 1
  end

end
