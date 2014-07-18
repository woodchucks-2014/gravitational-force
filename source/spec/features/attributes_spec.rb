require 'rails_helper'

feature 'ability to view attributes' do

  scenario 'when user visits index' do
    FactoryGirl.create :attribute
    visit attributes_path
    expect(page).to have_content "Attribute_name"
  end

end
