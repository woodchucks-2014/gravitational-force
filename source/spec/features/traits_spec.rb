require 'spec_helper'
require 'rails_helper'

feature 'ability to view traits' do

  scenario 'when user visits index' do
    t = FactoryGirl.create :trait
    visit traits_path
    expect(page).to have_content t.name
  end

  scenario 'when user rates a trait' do
    pending "not yet implemented"
    FactoryGirl.create :trait
    # visit attributes_path
    # find(:xpath, "//input[@id='attr_rating']").set 57
    # check('set_attribute')
    # click_button('submit')
    # expect(Rating.all).to change(Rating, :count).by 1
  end

end
