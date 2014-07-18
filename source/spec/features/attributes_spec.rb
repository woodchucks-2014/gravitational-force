require 'spec_helper'
require 'rails_helper'

feature 'ability to view attributes' do 

  scenario 'when user visits index' do
    FactoryGirl.create :attribute
    visit attributes_path
    expect(page).to have_content "Attribute_name"
  end

  scenario 'when user rates and attribute' do
    FactoryGirl.create :attribute
    visit attributes_path
    find(:xpath, "//input[@id='attr_rating']").set 57
    check('set_attribute')
    click_button('submit')
    expect(Rating.all).to change(Rating, :count).by 1
  end

end