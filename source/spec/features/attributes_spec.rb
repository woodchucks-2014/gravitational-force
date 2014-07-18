require 'spec_helper'
require 'rails_helper'

feature 'ability to view attributes' do 

  scenario 'when user visits index' do
    visit attributes_path
    FactoryGirl.create :attribute
    expect(page).to have_content "Attribute_name"
  end

end